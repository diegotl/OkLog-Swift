//
//  ViewController.swift
//  OkLog
//
//  Created by diegotl on 06/30/2018.
//  Copyright (c) 2018 diegotl. All rights reserved.
//

import UIKit
import OkLog

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
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logPost() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPost)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["key": "post value"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logPut() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPut)")!
        let request = makeRequest(url: url, method: "PUT", parameters: ["key": "put value"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logDelete() {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlDelete)")!
        let request = makeRequest(url: url, method: "DELETE", parameters: ["key": "delete value"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }

}

