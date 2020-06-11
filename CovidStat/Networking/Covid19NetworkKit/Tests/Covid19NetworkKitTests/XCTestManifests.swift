import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Covid19NetworkKitTests.allTests),
    ]
}
#endif
