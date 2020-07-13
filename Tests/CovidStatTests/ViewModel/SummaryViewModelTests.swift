//
//  SummaryViewModelTests.swift
//  CovidStatTests
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import XCTest
@testable import CovidStats
import Covid19NetworkKit

class SummaryViewModelTests: XCTestCase {

    var viewModel: SummaryViewModel!

    let fileNameWithStab = "SummaryFake"

    func testSuccessFetchData() throws {
        let data = loadStub(name: fileNameWithStab, fileExt : "json")
        
        // Create JSON Decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let totalCountryCases = try decoder.decode(Summary.self, from: data)
    
        XCTAssertEqual(totalCountryCases.countries?.count, 6)
    }
    
    override func setUpWithError() throws {
        let data = loadStub(name: fileNameWithStab, fileExt : "json")

        // Create JSON Decoder
        let decoder = JSONDecoder()

        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970

        // Decode JSON
        let summaryData = try decoder.decode(Summary.self, from: data)
        let service = MockSummaryService(mockData: summaryData)
        let store = SummaryStore(summaryService: service)
        
        // Initialize View Model
        viewModel = SummaryViewModel(summaryStore: store)
        store.loadSummary()
    }

    func testAlphabeticalOrder() throws {
        viewModel.sortCountriesInAlphabeticalOrder()
        XCTAssertEqual(viewModel.summaryStore.state?.countries?.first?.country, "Virgin Islands, US")
        XCTAssertEqual(viewModel.summaryStore.state?.countries?.last?.country, "Zimbabwe")
    }
    
    func testTotalDeathOrder() throws {
        viewModel.sortCountriesByTotalDeath()
        XCTAssertEqual(viewModel.summaryStore.state?.countries?.first?.country, "Zambia")
        XCTAssertEqual(viewModel.summaryStore.state?.countries?.last?.country, "Yemen")
    }
    
    func testNewConfirmedOrder() throws {
        viewModel.sortCountriesByDailyCases()
        XCTAssertEqual(viewModel.summaryStore.state?.countries?.first?.country, "Zimbabwe")
    }
}
