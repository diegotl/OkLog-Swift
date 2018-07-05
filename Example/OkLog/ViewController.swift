//
//  ViewController.swift
//  OkLog
//
//  Created by diegotl on 06/30/2018.
//  Copyright (c) 2018 diegotl. All rights reserved.
//

import UIKit
import OkLog
import Alamofire

class ViewController: UIViewController {
    
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
    
    @IBAction private func logGet() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlGet)")!
        let request = makeRequest(url: url, method: "GET", parameters: nil)
        
        OkLog.willSend(request)
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logPost() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPost)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["id": 1, "name": "John Johnson"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logPut() {
        
        let request = Alamofire.request("\(Constants.urlBase)\(Constants.urlPut)",
            method: .put,
            parameters: ["id": 2, "name": "James Smith"],
            encoding: JSONEncoding.default,
            headers: Constants.headerFields)
        
        OkLog.willSend(request)
        
        request.responseJSON { response in
            OkLog.log(response)
        }
        
    }
    
    @IBAction private func logDelete() {
        
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

