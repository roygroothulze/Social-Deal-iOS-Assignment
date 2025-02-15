//
//  DealsOverviewViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit

class DealsOverviewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Deals"
        loadDeals()
        setupView()
    }
    
    private let dealsViewController = DealsListViewController()
    
    private func setupView() {
        
        // Add the dealsViewController as a child view controller
        addChild(dealsViewController)
        view.addSubview(dealsViewController.view)

        // Set up constraints for the dealsViewController's view
        dealsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dealsViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            dealsViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dealsViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dealsViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Notify the child view controller that it has been moved to a parent
        dealsViewController.didMove(toParent: self)
    }
    
    private func loadDeals() {
        Task {
            let deals = await DealService.shared.fetchDeals()
            print(deals)
        }
    }
}
