//
//  initalizerBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/2/24.
//

import SwiftUI

struct initalizerBootcamp: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    initalizerBootcamp(backgroundColor: .blue, count: 19, title: "Orange")
}
