//
//  Element.swift
//  MPDictionary
//
//  Created by Manh Pham on 19/09/2022.
//

import Foundation

struct Element: Codable, Identifiable {
    var id: String
    var items: [ElementData]
}

struct ElementData: Codable, Identifiable {
    var id: Int
    var en: String
    var vi: String
    var spell: String
}
