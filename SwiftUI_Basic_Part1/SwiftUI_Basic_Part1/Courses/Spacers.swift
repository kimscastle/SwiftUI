//
//  Spacers.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(height: 10)
                    .background(.red)
                Text("KUS")
                Spacer()
                    .frame(height: 10)
                    .background(.red)
                Image(systemName: "heart.fill")
                    .foregroundStyle(.blue)
                Spacer()
                    .frame(height: 10)
                    .background(.red)
                Circle()
                    .frame(width: 30, height: 30)
            }
            .background(.yellow)
            Spacer()
                .frame(width: 10)
                .background(.red)
            Rectangle()
                .frame(width: .infinity, height: 100)
        }
    }
}

#Preview {
    Spacers()
}
