//
//  Extensions.swift
//  OkLog
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
            
            requestHeaders = request.allHTTPHeaderFields?.map({ key, value -> HeaderData in
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

extension Dictionary {
    
    var queryString: String {
        var output: String = ""
        for (key, value) in self {
            output +=  "\(key)=\(value)&"
        }
        
        output = String(output.dropLast())
        return output
    }
    
}
