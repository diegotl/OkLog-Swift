//
//  Data.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

import Foundation

extension Data {
    func safeEncoded() -> String? {
        try? self
            .gzipped()
            .base64EncodedString()
            .safeUrlString()
    }
}
