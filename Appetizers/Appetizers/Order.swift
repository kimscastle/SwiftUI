//
//  Order.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        self.items.append(appetizer)
    }
    
    func deletItem(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
    
    var totalCount: Int {
        return items.count
    }
}
