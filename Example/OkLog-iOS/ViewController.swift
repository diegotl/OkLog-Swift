//
//  ViewController.swift
//  OkLog
//
//  Created by diegotl on 06/30/2018.
//  Copyright (c) 2018 diegotl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction private func logGet() {
        Client().logGet()
    }
    
    @IBAction private func logPost() {
        Client().logPost()
    }
    
    @IBAction private func logPut() {
        Client().logPut()
    }
    
    @IBAction private func logDelete() {
        Client().logDelete()
    }

}

