//
//  ExtensionsTests.swift
//  
//
//  Created by Diego Trevisan Lara on 02/09/19.
//

import XCTest
@testable import OkLog

final class ExtensionsTests: XCTestCase {
    
    func test_query_string() {
        let dict = ["value1": "key1", "value2": "key2"]
        
        XCTAssertTrue(dict.queryString.contains("value1=key1"))
        XCTAssertTrue(dict.queryString.contains("value2=key2"))
    }
    
    func test_safe_url_string() {
        XCTAssertEqual("a+b/c".safeUrlString(), "a-b_c")
    }
    
    func test_safe_encoded() {
        let data = "string".data(using: .utf8)
        XCTAssertNotNil(data?.safeEncoded)
    }

//    static var allTests = [
//        ("testExample", test_query_string),
//    ]
    
}
