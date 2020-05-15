//
//  SummaryViewModel.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation

final class SummaryViewModel : ObservableObject
{
    @Published private(set) var summary: Summary?
    
    private let summaryService: SummaryService
    
    init(summaryService: SummaryService) {
        self.summaryService = summaryService
        self.loadSummary()
    }
    
    func sortCountriesInAlphabeticalOrder() -> Void{
        guard self.summary != nil || self.summary?.countries != nil else {return}
        
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
    
    func loadSummary() -> Void{
        summaryService.loadCovidSummary() { result in
            DispatchQueue.main.async{
                switch result{
                case .success(let stat):
                    self.summary = stat!
                case .failure(let error):
                    print("Failed to load summary: " + error.localizedDescription)
                }
            }
        }
    }
}
