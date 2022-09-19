//
//  DataSource.swift
//  MPDictionary
//
//  Created by Manh Pham on 19/09/2022.
//

import Foundation

struct DataSource {
    
    static let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
    
    static func getData() throws -> Dictionary {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            throw AppError.jsonNotFound
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let obj = try JSONDecoder().decode(Dictionary.self, from: data)
        return obj
    }
}


