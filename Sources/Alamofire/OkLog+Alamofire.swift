//
//  Extensions.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 30/06/2018.
//

import OkLog
import Alamofire

protocol IOkLogAlamofire: IOkLog {
    static func willSend(_ dataRequest: DataRequest)
    static func log<T>(_ dataResponse: DataResponse<T>, shortenUrl: Bool)
    static func getUrl<T>(_ dataResponse: DataResponse<T>, shortenUrl: Bool) -> String
}

extension OkLog: IOkLogAlamofire {
    
    public static func willSend(_ dataRequest: DataRequest) {
        guard let urlRequest = dataRequest.request else { return }
        willSend(urlRequest)
    }
    
    public static func log<T>(_ dataResponse: DataResponse<T>, shortenUrl: Bool = true) {
        log(request: dataResponse.request, response: dataResponse.response, data: dataResponse.data, shortenUrl: shortenUrl)
    }
    
    public static func getUrl<T>(_ dataResponse: DataResponse<T>, shortenUrl: Bool = true) -> String {
        return getUrl(request: dataResponse.request, response: dataResponse.response, data: dataResponse.data, shortenUrl: shortenUrl)
    }
    
}
