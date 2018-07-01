//
//  Extensions.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 30/06/2018.
//

import Alamofire

extension OkLog {
    
    public static func log<T>(_ response: Alamofire.DataResponse<T>) {
        log(request: response.request, response: response.response, data: response.data)
    }
    
    public static func getUrl<T>(_ response: Alamofire.DataResponse<T>) -> String {
        return getUrl(request: response.request, response: response.response, data: response.data)
    }
    
}
