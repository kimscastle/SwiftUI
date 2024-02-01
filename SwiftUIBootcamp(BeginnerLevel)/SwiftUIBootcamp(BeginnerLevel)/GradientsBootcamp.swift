//
//  GradientsBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 300, height: 200)

    }
}

#Preview {
    GradientsBootcamp()
}
