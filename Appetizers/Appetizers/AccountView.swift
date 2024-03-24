//
//  AccountView.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    // Content
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)

                    Button {
                        // Action
                        viewModel.saveChange()
                    } label: {
                        Text("Save Changes")
                    }
                    
                } header: {
                    Text("Personal Info")
                    
                } //:SECTION
                
                Section {
                    // Content
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    
                } header: {
                    Text("Requests")
                    
                } //:SECTION
                .tint(.accent)
                
            } //:FORM
            .navigationTitle("😂 Account")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .task {
                viewModel.retrieveUser()
            }
        } //:NAVSTACK
    }
}

#Preview {
    AccountView()
}
