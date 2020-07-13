//
//  CasesViewModelTests.swift
//  CovidStatTests
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import XCTest
@testable import CovidStats
import Covid19NetworkKit

class CasesViewModelTests: XCTestCase {

    var viewModel: CasesViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        
        let data = loadStub(name: "CountryCasesFake", fileExt : "json")

        // Create JSON Decoder
        let decoder = JSONDecoder()

        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970

        // Decode JSON
        let totalCountryCases = try decoder.decode([TotalCountryCases].self, from: data)

        // Initialize View Model
        viewModel = CasesViewModel(cases: totalCountryCases, casesService: CasesService())
        
        self.viewModel.countNewCases()
    }

    func testLastDate() {
        XCTAssertEqual(viewModel.totalCases.last?.date, "2020-04-04T00:00:00Z")
    }

    func testTotalCasesCountInJson() {
        XCTAssertEqual(viewModel.totalCases.count, 6)
    }

}
