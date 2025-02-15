//
//  Deal.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

struct DealsResponse: Codable {
    let numDeals: Int
    let deals: [Deal]
    
    enum CodingKeys: String, CodingKey {
        case numDeals = "num_deals"
        case deals
    }
}

struct Deal: Codable, Identifiable {
    var id: String { unique }
    let unique: String
    let title: String
    let image: String
    let soldLabel: String
    let company: String
    let city: String
    let prices: Prices
    
    enum CodingKeys: String, CodingKey {
        case unique
        case title
        case image
        case soldLabel = "sold_label"
        case company
        case city
        case prices
    }
}

struct Prices: Codable {
    let price: Price
    let fromPrice: Price?
    let priceLabel: String?
    let discountLabel: String?
    
    enum CodingKeys: String, CodingKey {
        case price
        case fromPrice = "from_price"
        case priceLabel = "price_label"
        case discountLabel = "discount_label"
    }
}

typealias PriceAmount = Int

struct Price: Codable {
    let amount: PriceAmount
    let currency: PriceCurrency
}

struct PriceCurrency: Codable {
    let symbol: String
    let code: String
}
