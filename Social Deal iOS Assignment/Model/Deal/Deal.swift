//
//  Deal.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import Foundation

struct Deal: Codable, Identifiable {
    var id: String { unique }
    let unique: String
    let title: String
    let description: String?
    let image: DealImage?
    let soldLabel: String
    let company: String
    let city: String
    let prices: Prices
    
    enum CodingKeys: String, CodingKey {
        case unique
        case title
        case description
        case image
        case soldLabel = "sold_label"
        case company
        case city
        case prices
    }
}
