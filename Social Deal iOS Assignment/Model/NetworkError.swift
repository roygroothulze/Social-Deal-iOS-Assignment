//
//  NetworkError.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//


enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case requestFailed = "Request Failed"
    case invalidResponse = "Invalid Response"
    case decodingFailed = "Decoding Failed"
}
