//
//  GridLayout.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct GridLayout: View {
    //adaptive는 우리가 예측할수없으니 쓰지말자
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: nil) {
                ForEach(0..<100, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.yellow)
                        .frame(height: 100)
                }
            }
        }
    }
}

#Preview {
    GridLayout()
}
