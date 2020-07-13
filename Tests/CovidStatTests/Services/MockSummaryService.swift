//
//  MockSummaryService.swift
//  CovidStatTests
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
@testable import CovidStats
import Covid19NetworkKit

class MockSummaryService : SummaryServiceProtocol {
    let mockData: Summary?
    
    init(mockData: Summary) {
        self.mockData = mockData
    }
    func loadCovidSummary(completion: @escaping (_ results: Result<Summary?, Error>) ->  Void){
        completion(.success(mockData!))
    }

}
