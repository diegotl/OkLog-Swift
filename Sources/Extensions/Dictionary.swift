//
//  Dictionary.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

extension Dictionary {
    var queryString: String {
        self.map { (key, value) in
            "\(key)=\(value)"
        }.joined(separator: "&")
    }
}

extension Dictionary where Key == String, Value == String {
    var headerData: [HeaderData] {
        self.map { (key, value) -> HeaderData in
            var headerData = HeaderData()
            headerData.name = key
            headerData.value = value
            return headerData
        }
    }
}
