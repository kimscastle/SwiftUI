//
//  Gradients.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
//        Rectangle()
//            .fill(LinearGradient(colors: [.yellow, .pink, .green, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
//            .frame(width: 200, height: 200)
//            .cornerRadius(20)
        Rectangle()
            .fill(AngularGradient(colors: [.yellow, .red], center: .center, angle: .degrees(90)))
    }
}

#Preview {
    Gradients()
}
