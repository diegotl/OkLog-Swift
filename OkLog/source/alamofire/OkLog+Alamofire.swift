//
//  Extensions.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 30/06/2018.
//

import Alamofire

protocol IOkLogAlamofire: IOkLog {
    static func willSend(_ dataRequest: DataRequest)
    static func log<T>(_ dataResponse: DataResponse<T>)
    static func getUrl<T>(_ dataResponse: DataResponse<T>) -> String
}

extension OkLog: IOkLogAlamofire {
    
    public static func willSend(_ dataRequest: DataRequest) {
        guard let urlRequest = dataRequest.request else { return }
        willSend(urlRequest)
    }
    
    public static func log<T>(_ dataResponse: DataResponse<T>) {
        log(request: dataResponse.request, response: dataResponse.response, data: dataResponse.data)
    }
    
    public static func getUrl<T>(_ dataResponse: DataResponse<T>) -> String {
        return getUrl(request: dataResponse.request, response: dataResponse.response, data: dataResponse.data)
    }
    
}
