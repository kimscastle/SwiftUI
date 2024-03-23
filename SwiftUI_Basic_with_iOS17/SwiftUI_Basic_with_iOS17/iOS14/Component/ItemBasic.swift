//
//  ItemBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct ItemBasic: View {
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text("\(title)")
        }
        .padding()
        .background(color)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ItemBasic(title: "test", count: 2, color: .blue)
}
