//
//  DealService.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import Foundation

class DealService {
    static let shared = DealService()
    private init() {}
    
    func fetchDeals() async -> [Deal] {
        do {
            return try await APIRepository.fetchDeals()
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
