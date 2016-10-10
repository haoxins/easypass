import XCTest
@testable import sync

class syncTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(sync().text, "sync!")
    }

    static var allTests : [(String, (syncTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
