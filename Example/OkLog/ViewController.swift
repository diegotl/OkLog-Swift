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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["User-Agent": "OkLogExample"]
        request.httpBody = "teste".data(using: .utf8)
        
        session.dataTask(with: request) { (data, response, error) in
            OkLog.log(request: request, response: response, data: data)
        }.resume()
        
    }

}

