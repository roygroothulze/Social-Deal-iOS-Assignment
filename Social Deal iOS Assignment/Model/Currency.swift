//
//  Currency.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

import Foundation

enum Currency: Int, CaseIterable {
    case euro = 0
    case dollar = 1
    
    var title: String {
        switch self {
        case .euro:
            return "Euro"
        case .dollar:
            return "Dollar"
        }
    }
    
    var symbol: String {
        switch self {
        case .euro:
            return "€"
        case .dollar:
            return "$"
        }
    }
    
    var fromEuroMultiplier: Double {
        switch self {
        case .euro:
            return 1
        case .dollar:
            return 0.89
        }
    }
}
