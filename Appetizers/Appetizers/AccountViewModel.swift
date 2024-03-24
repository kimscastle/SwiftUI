//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValid: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        return true
    }
    
    func saveChange() {
        if isValid {
            do {
                let data = try JSONEncoder().encode(user)
                userData = data
                alertItem = AlertContext.userSaveSuccess
            } catch {
                alertItem = AlertContext.invalidUserData
            }
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
