//
//  Price.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

struct Price: Codable {
    let amount: PriceAmount
    let currency: PriceCurrency
    
    func toString(currency: Currency) -> String {
        return "\(currency.symbol) \((Double(amount) * currency.fromEuroMultiplier).toDecimalString())"
    }
}
