//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowDetail = true
                        }
                } //:LIST
                .listStyle(.plain)
                .navigationTitle("🍟 Appetizer")
                .disabled(viewModel.isShowDetail)
            } //:NAVSTACK
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowDetail ? 20 : 0)
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(.accent)
            }
            
            if viewModel.isShowDetail {
                AppetizerDetailView(appetizser: viewModel.selectedAppetizer!,
                                    isShowDetail: $viewModel.isShowDetail)
            }
            
        } //:ZSTACK
        // MARK: - 나중에 custom Binding으로 수정해야할것들
        .alert(item: $viewModel.alertItem) {
            Alert(title: $0.title, message: $0.message, dismissButton: $0.dismissButton)
        }
    } //:BODY
    
}

#Preview {
    AppetizerListView()
}
