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
}
