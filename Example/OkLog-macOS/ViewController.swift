//
//  ViewController.swift
//  OkLog-macOS
//
//  Created by Diego Trevisan Lara on 11/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBAction private func logGet(sender: NSButton) {
        Client().logGet()
    }
    
    @IBAction private func logPost(sender: NSButton) {
        Client().logPost()
    }
    
    @IBAction private func logPut(sender: NSButton) {
        Client().logPut()
    }
    
    @IBAction private func logDelete(sender: NSButton) {
        Client().logDelete()
    }

}
