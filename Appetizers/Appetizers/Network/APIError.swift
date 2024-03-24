//
//  APIError.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
