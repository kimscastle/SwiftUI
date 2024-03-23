//
//  ExtractSubviewBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct ExtractSubviewBasic: View {
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            ItemBasic(title: "사과", count: 1, color: .red)
            ItemBasic(title: "오랜지", count: 10, color: .orange)
            ItemBasic(title: "바나나", count: 2, color: .yellow)
        }
    }
}

#Preview {
    ExtractSubviewBasic()
}
