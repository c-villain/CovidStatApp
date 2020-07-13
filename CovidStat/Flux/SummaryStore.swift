//
//  SummaryStore.swift
//  CovidStat
//
//  Created by Alexander Kraev on 11.06.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

final class SummaryStore : ObservableObject{
    
    @Published var state: Summary?
    
    @Published var pieChartData = PieChartData(data: [Double]())
    
    private let summaryService: SummaryServiceProtocol
    
    
    init(summaryService: SummaryServiceProtocol) {
        self.summaryService = summaryService
        self.loadSummary()
    }
    
    func dispatch(action: SummaryStoreActions) {
        guard state != nil else {
            self.loadSummary()
            return
        }
        
        let sorted: [Country]?
        switch action {
            case .AlphabeticalOrder:
                 sorted = self.state?.countries?.sorted{
                    $0.country! < $1.country!}
            case .DailyCases:
                 sorted = self.state?.countries?.sorted{
                    $0.newConfirmed! > $1.newConfirmed!}
            case .TotalDeath:
                 sorted = self.state?.countries?.sorted{
                    $0.totalDeaths! > $1.totalDeaths!}
        }
        self.state?.countries = sorted
    }
    
    func loadSummary() -> Void{
        self.summaryService.loadCovidSummary() { result in
            switch result{
            case .success(let stat):
                self.state = stat
                self.generateChartData(stat?.global)
            case .failure(let error):
                print("Failed to load summary: " + error.localizedDescription)
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
