import XCTest
@testable import OkLog

final class OkLogTests: XCTestCase {
    
    func test_query_string() {
        let dict = ["value1": "key1", "value2": "key2"]
        
        XCTAssertTrue(dict.queryString.contains("value1=key1"))
    }

    static var allTests = [
        ("testExample", test_query_string),
    ]
    
}
