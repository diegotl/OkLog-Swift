import XCTest
@testable import OkLog

@available(macOS 12.0, *)
final class OkLogTests: XCTestCase {
    
    func testGenerateLogUrl() async throws {
        // Given
        let urlString = "https://httpbin.org/get?key=value"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)

        // When
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        // Then
        let logUrl = OkLog.generateLogUrl(request: urlRequest, response: response, data: data)
        XCTAssertNotNil(logUrl)
        XCTAssertFalse(logUrl!.replacingOccurrences(of: "http://oklog.responseecho.com/v1/r/", with: "").isEmpty)
    }

    static var allTests = [
        testGenerateLogUrl
    ]
    
}
