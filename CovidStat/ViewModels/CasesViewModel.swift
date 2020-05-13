//
//  CasesViewModel.swift
//  CovidStat
//
//  Created by Alexander Kraev on 12.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI

final class CasesViewModel : ObservableObject
{
    @Published private(set) var totalCases: [TotalCountryCases] = [TotalCountryCases]()
    
    private let casesService: CasesService
    
    init(casesService: CasesService) {
        self.casesService = casesService
    }
    
    func clearCases() -> Void{
        self.totalCases.removeAll()
    }
    
    func loadAllCases(countrySlug: String) -> Void{
        casesService.loadAllCases(countrySlug: countrySlug) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let allCases):
                    self.totalCases.append(contentsOf: allCases)
                case .failure(let error):
                    print("Faied to load summary: " + error.localizedDescription)
                }
            }
        }
    }
}
