//
//  Prices.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

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
