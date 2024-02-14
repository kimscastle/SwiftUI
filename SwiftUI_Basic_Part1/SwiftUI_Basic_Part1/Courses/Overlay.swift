//
//  Overlay.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Overlay: View {
    var body: some View {
        Rectangle()
            .fill(.indigo)
            .frame(width: 200, height: 100)
            .cornerRadius(20)
            .overlay(alignment: .center) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.yellow)
                    .font(.title)
            }
            .overlay(alignment: .topLeading) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .font(.title)
            }
            .overlay(alignment: .topTrailing) {
                Image(systemName: "moon.stars.fill")
                    .foregroundStyle(.pink)
                    .font(.title)
            }
            .overlay(alignment: .bottomLeading) {
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(.yellow)
                    .font(.title)
            }
            .background {
                Circle()
                    .fill(.cyan)
                    .frame(width: 250, height: 250)
            }
    }
}

#Preview {
    Overlay()
}
