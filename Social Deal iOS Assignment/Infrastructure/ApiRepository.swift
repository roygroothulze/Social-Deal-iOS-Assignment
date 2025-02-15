//
//  ApiRepository.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import Foundation

class APIRepository {
    private static let baseURL = "https://media.socialdeal.nl/demo/deals.json"

    static func fetchDeals() async throws -> [Deal] {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }

        do {
            let dealsResponse = try JSONDecoder().decode(DealsResponse.self, from: data)
            return dealsResponse.deals
        } catch {
            print(error)
            throw NetworkError.decodingFailed
        }
    }
}
