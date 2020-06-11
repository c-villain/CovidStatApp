import XCTest
@testable import Covid19NetworkKit

final class Covid19NetworkKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Covid19NetworkKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
