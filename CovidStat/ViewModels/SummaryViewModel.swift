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
    
    func loadSummary() -> Void{
        summaryService.loadCovidSummary() { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let stat):
                    self.summary = stat!
                case .failure(let error):
                    print("Faied to load summary: " + error.localizedDescription)
                }
            }
        }
    }
}
