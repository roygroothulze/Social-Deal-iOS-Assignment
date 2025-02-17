//
//  Double+Extension.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

extension Double {
    func toDecimal() -> Double {
        return Double(self) / 100
    }
    
    func toDecimalString() -> String {
        return String(format: "%.2f", toDecimal())
    }
}
