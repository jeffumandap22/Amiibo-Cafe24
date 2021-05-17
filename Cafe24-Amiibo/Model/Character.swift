//
//  Character.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import Foundation

struct Amiibo: Codable {
    let amiibo: [Character]
}

struct Character: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
}
