//
//  XCTestCaseExt.swift
//  CovidStatTests
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import XCTest

extension XCTestCase {
    // MARK: - Helper Methods

    func loadStub(name: String, fileExt: String) -> Data {
        // Obtain Reference to Bundle
        let bundle = Bundle(for: type(of: self))

        // Ask Bundle for URL of Stub
        let url = bundle.url(forResource: name, withExtension: fileExt)

        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
    }
}
