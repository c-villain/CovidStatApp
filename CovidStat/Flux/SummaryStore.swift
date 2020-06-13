//
//  SummaryStore.swift
//  CovidStat
//
//  Created by Alexander Kraev on 11.06.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

final class SummaryStore<Summary,Action>: ObservableObject{
    
    @Published var state: Summary?
    
    @Published var pieChartData = PieChartData(data: [Double]())
    
    typealias Reducer = (Summary, Action) -> Summary
    
    public let reducer: Reducer
    
    private let summaryService: SummaryService
    
    init(summaryService: SummaryService, reduce: @escaping Reducer) {
        self.summaryService = summaryService
        reducer = reduce
        self.loadSummary()
    }
    
    func dispatch(action: Action) {
        guard state != nil else {
            self.loadSummary()
            return
        }
        state = reducer(state!, action)
    }
    
    func loadSummary() -> Void{
        self.summaryService.loadCovidSummary() { result in
            DispatchQueue.main.async{
                switch result{
                case .success(let stat):
                    self.state = stat as? Summary
                    self.generateChartData(stat?.global)
                case .failure(let error):
                    print("Failed to load summary: " + error.localizedDescription)
                }
            }
        }
    }
    
    func generateChartData(_ summaryGlobal: SummaryGlobal?) -> Void {
        guard summaryGlobal != nil else {return }
        // reset view
        pieChartData = PieChartData(data: [Double]())
        var values: [Double] = []

        values.append(Double(summaryGlobal!.totalConfirmed! - summaryGlobal!.totalRecovered! - summaryGlobal!.totalDeaths! ))
        values.append(Double(summaryGlobal!.totalRecovered! ))
        values.append(Double(summaryGlobal!.totalDeaths! ))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.pieChartData = PieChartData(data: values)
        }
    }
}
