//
//  Extensions.swift
//  GzipSwift
//
//  Created by Diego Trevisan Lara on 30/06/2018.
//

import Gzip
import SwiftProtobuf

extension LogData {
    
    init(request: URLRequest?, response: URLResponse?, data: Data?) {
        
        // Request Data
        if let request = request {
            requestURL = request.url?.absoluteString ?? ""
            requestMethod = request.httpMethod ?? ""
            self.protocol = request.url?.scheme ?? ""
            //logData.requestContentType
            requestContentLength = Int64(request.httpBody?.count ?? 0)
            
            requestHeaders = request.allHTTPHeaderFields?.keys.compactMap({ key -> HeaderData? in
                guard let value = request.allHTTPHeaderFields?[key] else { return nil }
                var headerData = HeaderData()
                headerData.name = key
                headerData.value = value
                return headerData
            }) ?? []
        }
        
        // Response Data
        if let response = response as? HTTPURLResponse {
            responseCode = Int32(response.statusCode)
            responseMessage = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
            //logData.responseDurationMs
            responseContentLength = response.expectedContentLength
            responseBodySize = Int64(data?.count ?? 0)
            responseURL = response.url?.absoluteString ?? ""
            
            responseHeaders = response.allHeaderFields.keys.compactMap({ key -> HeaderData? in
                guard let key = key as? String, let value = response.allHeaderFields[key] as? String else { return nil }
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

extension Data {
    
    func safeEncoded() -> String? {
        do {
            let gzipped = try self.gzipped()
            return gzipped.base64EncodedString().safeUrlString()
            
        } catch {
            return nil
        }
    }
    
}

extension String {
    
    func safeUrlString() -> String {
        return replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_")
    }
    
}
