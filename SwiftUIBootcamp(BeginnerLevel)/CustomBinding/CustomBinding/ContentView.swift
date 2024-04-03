//
//  ContentView.swift
//  CustomBinding
//
//  Created by uiskim on 3/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Custom Alert"),
                content: AlertView(),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct AlertView: View {
    var body: some View {
        VStack {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("This is a custom alert with an image!")
        }
    }
}

#Preview {
    ContentView()
}
