//
//  FavouriteViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit

class FavouriteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupView()
    }
    
    private let favouriteViewController = FavouriteListViewController()
    
    private func setupView() {
        addChild(favouriteViewController)
        view.addSubview(favouriteViewController.view)

        // Set up constraints for the dealsViewController's view
        favouriteViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favouriteViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            favouriteViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favouriteViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favouriteViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        favouriteViewController.didMove(toParent: self)
    }
}
