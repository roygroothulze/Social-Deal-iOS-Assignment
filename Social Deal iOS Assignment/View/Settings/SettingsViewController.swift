//
//  SettingsViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit
import Combine

class SettingsViewController: UIViewController {
    private let viewModel = SettingsViewModel.shared
    private var cancellables = Set<AnyCancellable>()

    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "Change currency"
        return label
    }()

    private let currencyPicker: UISegmentedControl = {
        let picker = UISegmentedControl(items: Currency.allCases.map { $0.title })
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
    }

    private func setupUI() {
        view.addSubview(currencyLabel)
        view.addSubview(currencyPicker)

        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            currencyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currencyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            currencyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currencyPicker.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 20)
        ])

        currencyPicker.addTarget(self, action: #selector(currencyPickerChanged), for: .valueChanged)
        currencyPicker.selectedSegmentIndex = viewModel.selectedCurrency.rawValue
    }

    @objc private func currencyPickerChanged() {
        let selectedIndex = currencyPicker.selectedSegmentIndex
        let selectedCurrency = Currency.allCases[selectedIndex]
        viewModel.updateCurrency(to: selectedCurrency)
    }
}
