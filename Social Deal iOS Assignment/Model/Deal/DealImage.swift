//
//  DealImage.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 17/02/2025.
//

import Foundation

typealias DealImage = String

extension DealImage {
    var fullURL: URL? {
        URL(string: "https://images.socialdeal.nl\(self)")
    }
}
