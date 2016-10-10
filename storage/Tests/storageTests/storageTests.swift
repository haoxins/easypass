import XCTest
@testable import storage

class storageTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(storage().text, "storage!")
    }

    static var allTests : [(String, (storageTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
