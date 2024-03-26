//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        self.isLoading = true
        Task {
            do {
                self.appetizers = try await NetworkManger.shared.getAppetizers()
                self.isLoading = false
            } catch {
                if let apiError = error as? APIError {
                    switch apiError {
                    case .invalidData:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                    isLoading = false
                }
            }
        }
    }
}
