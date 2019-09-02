//
//  LogData.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

import Foundation
import Gzip
import SwiftProtobuf

extension LogData {
    
    init(request: URLRequest?, response: URLResponse?, data: Data?, firedAt: Date?) {
        
        // Request Data
        if let request = request {
            requestFailed = false
            requestURL = request.url?.absoluteString ?? ""
            requestMethod = request.httpMethod ?? ""
            self.protocol = request.url?.scheme ?? ""
            //logData.requestContentType
            requestContentLength = Int64(request.httpBody?.count ?? 0)
            
            requestHeaders = request.allHTTPHeaderFields?.map({ key, value -> HeaderData in
                var headerData = HeaderData()
                headerData.name = key
                headerData.value = value
                return headerData
            }) ?? []
        } else {
            requestFailed = true
        }
        
        // Response Data
        if let response = response as? HTTPURLResponse {
            responseCode = Int32(response.statusCode)
            responseMessage = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
            responseContentLength = response.expectedContentLength
            responseBodySize = Int64(data?.count ?? 0)
            responseURL = response.url?.absoluteString ?? ""
            
            if let firedAt = firedAt {
                responseDurationMs = Int64(Date().timeIntervalSince(firedAt) * 1000)
            }
            
            responseHeaders = response.allHeaderFields.compactMap({ key, value -> HeaderData? in
                guard let key = key as? String, let value = value as? String else { return nil }
                var headerData = HeaderData()
                headerData.name = key
                headerData.value = value
                return headerData
            })
        }
    }
    
    func safeEncoded() -> String? {
        do {
            let serializedData = try self.serializedData()
            let gzipped = try serializedData.gzipped()
            return gzipped.base64EncodedString().safeUrlString()
            
        } catch {
            return nil
        }
    }
    
}
