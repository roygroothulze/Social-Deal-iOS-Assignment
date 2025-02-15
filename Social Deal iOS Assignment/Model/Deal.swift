//
//  Deal.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import Foundation

struct DealsResponse: Codable {
    let numDeals: Int
    let deals: [Deal]
    
    enum CodingKeys: String, CodingKey {
        case numDeals = "num_deals"
        case deals
    }
}

typealias DealImage = String

extension DealImage {
    var fullURL: URL? {
        URL(string: "https://images.socialdeal.nl\(self)")
    }
}

struct Deal: Codable, Identifiable {
    var id: String { unique }
    let unique: String
    let title: String
    let image: DealImage
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

extension PriceAmount {
    func toDecimal() -> Double {
        return Double(self) / 100
    }
    
    func toDecimalString() -> String {
        return String(format: "%.2f", toDecimal())
    }
}

struct Price: Codable {
    let amount: PriceAmount
    let currency: PriceCurrency
    
    func toString() -> String {
        return "\(currency.symbol) \(amount.toDecimalString())"
    }
}

struct PriceCurrency: Codable {
    let symbol: String
    let code: String
}
