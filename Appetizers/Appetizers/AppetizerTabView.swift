//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.totalCount)
        } //:TABVIEW
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
