//
//  OrderView.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deletItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        // Action
                        
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                } //:VSTACK
                
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Yout have no items in your order. Please add an appetizer!")
                }
                
            } //:ZSTACK
            .navigationTitle("🧾 Order")
        } //:NAVSTACK
    }
    

}

#Preview {
    OrderView()
        .environmentObject(Order())
}
