//
//  DealViewModel.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import Foundation

@MainActor
class DealsListViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    @Published var errorMessage: String?

    private let dealService = DealService.shared

    func fetchDeals() async {
        deals = await dealService.fetchDeals()
    }
}
