//
//  MockCasesService.swift
//  CovidStatTests
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
@testable import CovidStats
import Covid19NetworkKit

class MockCasesService : CasesServiceProtocol {
    let mockData: [TotalCountryCases]?
    
    init(mockData: [TotalCountryCases]) {
        self.mockData = mockData
    }
    
    func loadAllCases(countrySlug: String, completion: @escaping (_ results: Result<[TotalCountryCases], Error>) ->  Void){
        completion(.success(mockData!))
    }
}
