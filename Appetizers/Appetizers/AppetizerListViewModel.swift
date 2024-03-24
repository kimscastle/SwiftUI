//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManger.shared.getAppetizers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                case .failure(let failure):
                    switch failure {
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self?.alertItem = AlertContext.unableToComplete
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                    }
                }
            }
        }
    }
}
