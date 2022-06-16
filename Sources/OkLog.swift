//
//  OkLog.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 28/06/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import Logging

public protocol OkLogProtocol {
    static func log(request: URLRequest?, response: URLResponse?, data: Data?)
    static func generateLogUrl(request: URLRequest?, response: URLResponse?, data: Data?) -> String?
}

public class OkLog: OkLogProtocol {
    // MARK: - Private variables
    private static let logger: Logger = .init(label: "oklog")
    private static let logLevel: Logger.Level = .debug

    // MARK: - Exposed functions
    public static func log(request: URLRequest?, response: URLResponse?, data: Data?) {
        let urlString: String? = {
            guard let absoluteString = request?.url?.absoluteString else { return nil }
            return "🔗 \(absoluteString)"
        }()

        let urlLogString: String? = {
            guard let logUrl = generateLogUrl(request: request, response: response, data: data) else { return nil }
            return "🐞 \(logUrl)"
        }()

        let resultString = [urlString, urlLogString].compactMap({ $0 }).joined(separator: "\n")
        logger.log(level: logLevel, "\(resultString)")
    }

    public static func generateLogUrl(request: URLRequest?, response: URLResponse?, data: Data?) -> String? {
        let logData = LogData(request: request, response: response, data: data)
        let requestBody = request?.httpBody?.safeEncoded()
        let responseBody = data?.safeEncoded() ?? "0"

        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "oklog.responseecho.com"
        urlComponents.path = "/v1/r/\(responseBody)"
        urlComponents.queryItems = [
            URLQueryItem(name: "qb", value: requestBody),
            URLQueryItem(name: "d", value: logData.safeEncoded()),
        ]

        return urlComponents.string
    }
}

final class OkLogURLProtocol: URLProtocol {
    // MARK: - Private varibles
    private var dataTask: URLSessionDataTask?

    // MARK: - URLProtocol implementation
    override init(request: URLRequest, cachedResponse: CachedURLResponse?, client: URLProtocolClient?) {
        super.init(request: request, cachedResponse: cachedResponse, client: client)
    }

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canInit(with task: URLSessionTask) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        let session = URLSession(configuration: .default)
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            OkLog.log(request: self!.request, response: response, data: data)
            guard let self = self else { return }

            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
                return
            }

            guard let response = response, let data = data else { return }

            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowed)
            self.client?.urlProtocol(self, didLoad: data)
            self.client?.urlProtocolDidFinishLoading(self)
        }
        dataTask?.resume()
    }

    override func stopLoading() {
        dataTask?.cancel()
    }
}
