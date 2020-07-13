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

    let fileNameWithStab = "CountryCasesFake"

    func testSuccessFetchData() throws {
        let data = loadStub(name: fileNameWithStab, fileExt : "json")
        
        // Create JSON Decoder
        let decoder = JSONDecoder()
        
        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970
        
        // Decode JSON
        let totalCountryCases = try decoder.decode([TotalCountryCases].self, from: data)
    
        XCTAssertEqual(totalCountryCases.count, 6)
    }
    
    override func setUpWithError() throws {
        let data = loadStub(name: fileNameWithStab, fileExt : "json")
        
        // Create JSON Decoder
        let decoder = JSONDecoder()
        
        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970
        
        // Decode JSON
        let totalCountryCases = try decoder.decode([TotalCountryCases].self, from: data)

        let service = MockCasesService(mockData: totalCountryCases)
        
        // Initialize View Model
        viewModel = CasesViewModel(casesService: service)
        viewModel.loadAllCases(countrySlug: "switzerland")
    }
    
    func testViewModelLoadngData() throws {
        XCTAssertEqual(viewModel.allCases.count, 6)
        XCTAssertEqual(viewModel.totalCases.count, 6)
    }
           
    func testLastDate() {
        XCTAssertEqual(viewModel.allCases.last?.date, "2020-06-10T00:00:00Z")
    }
}
