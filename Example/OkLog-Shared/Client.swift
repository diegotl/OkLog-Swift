//
//  Client.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 12/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import OkLog
import Alamofire

class Client {
    
    let session = URLSession(configuration: .default)
    
    private func makeRequest(url: URL, method: String, parameters: [String: Any]?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = Constants.headerFields
        
        if let parameters = parameters {
            let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = data
        }
        
        return request
    }
    
    func logGet() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlGet)")!
        let request = makeRequest(url: url, method: "GET", parameters: nil)
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
            }.resume()
        
    }
    
    func logPost() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPost)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["id": 1, "name": "John Johnson"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data, shortenUrl: false)
            }.resume()
        
    }
    
    func logPut() {
        
        let request = Alamofire.request("\(Constants.urlBase)\(Constants.urlPut)",
            method: .put,
            parameters: ["id": 2, "name": "James Smith"],
            encoding: JSONEncoding.default,
            headers: Constants.headerFields)
        
        request.responseJSON { response in
            OkLog.log(response, shortenUrl: false)
        }
        
    }
    
    func logDelete() {
        
        let request = Alamofire.request("\(Constants.urlBase)\(Constants.urlDelete)",
            method: .delete,
            parameters: ["id": 3, "name": "John Appleseed"],
            encoding: JSONEncoding.default,
            headers: Constants.headerFields)
        
        request.responseJSON { response in
            OkLog.log(response)
        }
        
    }
    
}
