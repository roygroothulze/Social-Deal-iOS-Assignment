//
//  DealsResponse.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

struct DealsResponse: Codable {
    let numDeals: Int
    let deals: [Deal]
    
    enum CodingKeys: String, CodingKey {
        case numDeals = "num_deals"
        case deals
    }
}
