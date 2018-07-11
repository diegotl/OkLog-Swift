//
//  ViewController.swift
//  OkLog-OSX
//
//  Created by Diego Trevisan Lara on 11/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Cocoa
import OkLog

class ViewController: NSViewController {

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
    
    @IBAction private func logGet(sender: NSButton) {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlGet)")!
        let request = makeRequest(url: url, method: "GET", parameters: nil)
        
        OkLog.willSend(request)
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }
    
    @IBAction private func logPost(sender: NSButton) {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPost)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["id": 1, "name": "John Johnson"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data, shortenUrl: false)
        }.resume()
        
    }
    
    @IBAction private func logPut(sender: NSButton) {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlPut)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["id": 2, "name": "James Smith"])
        
        OkLog.willSend(request)
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data, shortenUrl: false)
        }.resume()
        
    }
    
    @IBAction private func logDelete(sender: NSButton) {
        
        let url = URL(string: "\(Constants.urlBase)\(Constants.urlDelete)")!
        let request = makeRequest(url: url, method: "POST", parameters: ["id": 3, "name": "John Appleseed"])
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }

}
