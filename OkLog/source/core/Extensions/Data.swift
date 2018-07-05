//
//  Data.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

extension Data {
    
    func safeEncoded() -> String? {
        do {
            let gzipped = try self.gzipped()
            return gzipped.base64EncodedString().safeUrlString()
            
        } catch {
            return nil
        }
    }
    
}
