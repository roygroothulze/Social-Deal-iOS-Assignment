//
//  DealCardView.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit

class DealCardView: UIView {
    var deal: Deal?
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textColor = .black
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let soldAmountLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fromPriceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 23)
        view.textColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let favouriteIcon: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "heart"))
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()

    // Initialize the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // Setup the view components
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(companyLabel)
        addSubview(soldAmountLabel)
        addSubview(fromPriceLabel)
        addSubview(priceLabel)
        addSubview(favouriteIcon)
        
        let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFavouriteTap))
        favouriteIcon.addGestureRecognizer(tabGestureRecognizer)

        // Layout constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),

            companyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            companyLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),

            soldAmountLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            soldAmountLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),

            fromPriceLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            fromPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            favouriteIcon.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            favouriteIcon.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])
    }
    
    func configure(with deal: Deal) {
        self.deal = deal
        if let url = deal.image.fullURL {
            loadImage(from: url)
        }
        
        titleLabel.text = deal.title
        companyLabel.text = deal.company
        soldAmountLabel.text = deal.soldLabel
        
        let attributedString = NSMutableAttributedString(string: deal.prices.fromPrice?.toString() ?? "")
        attributedString.addAttribute(
            .strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        fromPriceLabel.attributedText = attributedString
        
        priceLabel.text = deal.prices.price.toString()
        
        if FavouriteService.shared.isFavourite(deal) {
            favouriteIcon.image = UIImage(systemName: "heart.fill")
        }
    }
    
    private func loadImage(from url: URL) {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                await MainActor.run {
                    self.imageView.image = UIImage(data: data)
                }
            } catch {
                // Handle error if necessary
                print("Failed to load image: \(error)")
            }
        }
    }
    
    @objc func handleFavouriteTap() {
        guard let deal else { return }
        if FavouriteService.shared.isFavourite(deal) {
            favouriteIcon.image = UIImage(systemName: "heart")
        } else {
            favouriteIcon.image = UIImage(systemName: "heart.fill")
        }
        
        FavouriteService.shared.toggleFavourite(deal)
    }

}
