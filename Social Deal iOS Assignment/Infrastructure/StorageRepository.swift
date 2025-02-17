//
//  StorageRepository.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 16/02/2025.
//

import Foundation

class StorageRepository {
    private static let favouritesKey = "favourites"
    static func saveFavourites(_ favourites: [Deal]) {
        let encodedData = try? JSONEncoder().encode(favourites)
        UserDefaults.standard.set(encodedData, forKey: favouritesKey)
    }
    
    static func getFavourites() -> [Deal] {
        guard let data = UserDefaults.standard.data(forKey: favouritesKey) else {
            return []
        }
        return try! JSONDecoder().decode([Deal].self, from: data)
    }
    
    private static let currencyKey = "currency"
    static func saveCurrency(_ currency: Currency) {
        UserDefaults.standard.set(currency.rawValue, forKey: currencyKey)
    }
    
    static func getCurrency() -> Currency {
        let data = UserDefaults.standard.integer(forKey: currencyKey)
        return Currency(rawValue: data) ?? .euro
    }
    
}
