import XCTest
@testable import OkLog

final class OkLogTests: XCTestCase {
    
    func test_log_url() {
        let expectation = XCTestExpectation()
        
        let urlString = "https://httpbin.org/get?key=value"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let logUrl = OkLog.getUrl(request: request, response: response, data: data)
            XCTAssertFalse(logUrl.replacingOccurrences(of: "http://oklog.responseecho.com/v1/r/", with: "").isEmpty)
            expectation.fulfill()
        }.resume()
        
        wait(for: [expectation], timeout: 10)
    }

    static var allTests = [
        test_log_url,
    ]
    
}
