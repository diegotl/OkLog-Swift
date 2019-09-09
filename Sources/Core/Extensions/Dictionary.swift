//
//  Dictionary.swift
//  OkLog
//
//  Created by Diego Trevisan Lara on 04/07/2018.
//

extension Dictionary {
    
    var queryString: String {
        var output: String = ""
        for (key, value) in self {
            output +=  "\(key)=\(value)&"
        }
        
        output = String(output.dropLast())
        return output
    }
    
}

extension Dictionary where Key == String, Value == String {
    
    var headerData: [HeaderData] {
        return self.map { key, value -> HeaderData in
            var headerData = HeaderData()
            headerData.name = key
            headerData.value = value
            return headerData
        }
    }
    
}
