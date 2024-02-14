//
//  ScrollViewLayout.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct ScrollViewLayout: View {
    var body: some View {
        Text("최신영화")
            .font(.system(size: 30, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow)
                        .frame(width: 300, height: 200)
                        .padding(.leading, 15)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ScrollViewLayout()
}
