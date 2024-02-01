//
//  ContentView.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello,World!")
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

#Preview {
    ContentView()
}
