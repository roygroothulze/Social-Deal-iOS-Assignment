//
//  DealTableViewCell.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit

class DealTableViewCell: UITableViewCell {

    private let dealCardView = DealCardView()
    
    var deal: Deal? {
        dealCardView.deal
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCardView()
    }

    private func setupCardView() {
        contentView.addSubview(dealCardView)
        dealCardView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dealCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dealCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dealCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dealCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(with deal: Deal) {
        dealCardView.configure(with: deal)
    }
    
    func reloadFavourite() {
        dealCardView.reloadFavourite()
    }
}
