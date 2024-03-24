//
//  NutritionInfo.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct NutritionInfo: View {
    let title: String
    let value: Int
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfo(title: "test", value: 239)
}
