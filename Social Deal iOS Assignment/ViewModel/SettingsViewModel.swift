//
//  SettingsViewModel.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//


import Foundation

class SettingsViewModel: ObservableObject {
    @Published var selectedCurrency: Currency = .euro
    
    static var shared = SettingsViewModel()
    private init() {
        selectedCurrency = StorageRepository.getCurrency()
    }

    func updateCurrency(to currency: Currency) {
        selectedCurrency = currency
        StorageRepository.saveCurrency(currency)
    }
}
