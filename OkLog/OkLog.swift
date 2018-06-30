//
//  OkLog.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 28/06/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

public class OkLog {
    
    public static func log(request: URLRequest?, response: URLResponse?, data: Data?) {
        print(getUrl(request: request, response: response, data: data))
    }
    
    public static func getUrl(request: URLRequest?, response: URLResponse?, data: Data?) -> String {
        let logData = LogData(request: request, response: response, data: data)
        let requestBody = request?.httpBody?.safeEncoded()
        let responseBody = data?.safeEncoded() ?? "0"
        
        var url = "http://oklog.responseecho.com/v1/r/\(responseBody)"
        
        if let requestBody = requestBody {
            url.append("?qb=\(requestBody)")
        }
        
        if let logDataString = logData.safeEncoded() {
            let separator = requestBody == nil ? "?" : "&"
            url.append("\(separator)d=\(logDataString)")
        }
        
        url.append("&s=1")
        
        return url
    }
    
}
