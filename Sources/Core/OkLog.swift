//
//  OkLog.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 28/06/18.
//  Copyright © 2018 Diego Trevisan Lara. All rights reserved.
//

import Foundation

public protocol IOkLog {
    static func log(request: URLRequest?, response: URLResponse?, data: Data?, shortenUrl: Bool)
    static func getUrl(request: URLRequest?, response: URLResponse?, data: Data?, shortenUrl: Bool) -> String
}

public class OkLog: IOkLog {
    
    public static func log(request: URLRequest?, response: URLResponse?, data: Data?, shortenUrl: Bool = true) {
        print(getUrl(request: request, response: response, data: data, shortenUrl: shortenUrl))
    }
    
    public static func getUrl(request: URLRequest?, response: URLResponse?, data: Data?, shortenUrl: Bool = true) -> String {
        
        let logData = LogData(request: request, response: response, data: data)
        let requestBody = request?.httpBody?.safeEncoded()
        let responseBody = data?.safeEncoded() ?? "0"
        
        var components = [String: Any]()
        components["qb"] = requestBody
        components["d"] = logData.safeEncoded()
        components["s"] = shortenUrl ? 1 : 0
        
        let url = "\(Constants.urlBaseRemote)\(Constants.urlBasePath)\(Constants.urlInfoPath)\(responseBody)?\(components.queryString)"
        return url
    }
    
}
