//
//  DealsListViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit
import Combine

class DealsListViewController: UIViewController {
    private let viewModel = DealsListViewModel()
    private var cancellables = Set<AnyCancellable>()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        Task {
            await viewModel.fetchDeals()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DealTableViewCell.self, forCellReuseIdentifier: "DealCell")
    }

    private func bindViewModel() {
        viewModel.$deals
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)

        viewModel.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                if let errorMessage = errorMessage {
                    self?.showAlert(message: errorMessage)
                }
            }
            .store(in: &cancellables)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension DealsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.deals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DealCell", for: indexPath) as? DealTableViewCell else {
            return UITableViewCell()
        }
        let deal = viewModel.deals[indexPath.row]
        cell.configure(with: deal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deal = viewModel.deals[indexPath.row]
        let vc = DealsDetailsViewController()
        vc.configure(dealId: deal.id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
