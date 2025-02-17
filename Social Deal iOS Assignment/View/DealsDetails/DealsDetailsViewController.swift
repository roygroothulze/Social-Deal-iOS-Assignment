//
//  DealsDetailsViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

import UIKit
import Combine
import WebKit

class DealsDetailsViewController: UIViewController {
    private let viewModel = DealsDetailsViewModel()
    private let dealCardView = DealCardView()
    private var cancellables = Set<AnyCancellable>()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        viewModel.$deal
            .receive(on: DispatchQueue.main)
            .sink { [self] _ in
                if let deal = viewModel.deal {
                    dealCardView.configure(with: deal)
                    
                    if let description = deal.description {
                        updateDescription(with: description)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func configure(dealId: String) {
        Task {
            await viewModel.fetchDeal(with: dealId)
        }
    }
    
    private func updateDescription(with description: String) {
        guard let data: Data = description.data(using: .utf8) else { return }
        
        NSAttributedString.loadFromHTML(data: data, options: [.characterEncoding: String.Encoding.utf8.rawValue]) { [self] attributed, attrs, error in
          guard nil == error else {
            // handle the error
            return
          }
            if let attributed {
                self.descriptionLabel.text = attributed.string
          }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(dealCardView)
        dealCardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            dealCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dealCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dealCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: dealCardView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: dealCardView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: dealCardView.trailingAnchor, constant: -20),
        ])
    }
}
