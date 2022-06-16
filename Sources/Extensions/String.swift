//
//  String.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

extension String {
    func safeUrlString() -> String {
        self
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
}
