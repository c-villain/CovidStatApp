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
    // MARK: - Access to Store
    
    @Published var summaryStore: SummaryStore<Summary, SummaryStoreActions>

    // MARK: - Initializer
    
    init(summaryStore: SummaryStore<Summary, SummaryStoreActions>) {
        self.summaryStore = summaryStore
    }
    
    // MARK: - Sorting Functions

    func sortCountriesInAlphabeticalOrder() -> Void{
        self.summaryStore.dispatch(action: .AlphabeticalOrder)
    }
    
    func sortCountriesByDailyCases() -> Void{
        self.summaryStore.dispatch(action: .DailyCases)
    }
    
    func sortCountriesByTotalDeath() -> Void{
        self.summaryStore.dispatch(action: .TotalDeath)
    }
    
}
