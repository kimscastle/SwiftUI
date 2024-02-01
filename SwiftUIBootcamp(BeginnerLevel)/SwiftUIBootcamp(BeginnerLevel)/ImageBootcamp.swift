//
//  ImageBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("bird")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    ImageBootcamp()
}
