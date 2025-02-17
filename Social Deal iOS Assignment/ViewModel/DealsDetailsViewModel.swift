//
//  DealsDetailsViewModel.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

import Foundation

@MainActor
class DealsDetailsViewModel: ObservableObject {
    @Published var deal: Deal?
    
    private let dealService = DealService.shared

    func fetchDeal(with id: String) async {
        deal = await dealService.fetchDeal(with: id)
    }
}
