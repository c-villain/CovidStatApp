//
//  SummaryViewModel.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI
import Covid19NetworkKit

final class SummaryViewModel : ObservableObject
{
    // MARK: - Access to Model
    
    @Published private(set) var summary: Summary?
    
    // MARK: - Access to PieChart
    
    @Published var pieChartData = PieChartData(data: [Double]())
    
    // MARK: - Access to service of loading summary
    
    private let summaryService: SummaryService
    
    // MARK: - Initializer
    
    init(summaryService: SummaryService) {
        self.summaryService = summaryService
        self.loadSummary()
    }
    
    // MARK: - Sorting Functions
    
    func sortCountriesInAlphabeticalOrder() -> Void{
        guard self.summary != nil || self.summary?.countries    != nil else {return}
        
        let sorted = self.summary?.countries?.sorted{
            $0.country! < $1.country!}
        
        self.summary?.countries = sorted
    }
    
    func sortCountriesByDailyCases() -> Void{
        guard self.summary != nil || self.summary?.countries != nil else {return}
        
        let sorted = self.summary?.countries?.sorted{
            $0.newConfirmed! > $1.newConfirmed!}
        
        self.summary?.countries = sorted
    }
    
    func sortCountriesByTotalDeath() -> Void{
        guard self.summary != nil || self.summary?.countries != nil else {return}
        
        let sorted = self.summary?.countries?.sorted{
            $0.totalDeaths! > $1.totalDeaths!}
        
        self.summary?.countries = sorted
    }
    
    
    // MARK: - Reload pie chart
    
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
    
    // MARK: - Load function
    
    func loadSummary() -> Void{
        self.summaryService.loadCovidSummary() { result in
            DispatchQueue.main.async{
                switch result{
                case .success(let stat):
                    self.summary = stat!
                    self.generateChartData(self.summary?.global)
                case .failure(let error):
                    print("Failed to load summary: " + error.localizedDescription)
                }
            }
        }
    }
    
}
