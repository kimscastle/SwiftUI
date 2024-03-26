//
//  ContentView.swift
//  CustomBinding
//
//  Created by uiskim on 3/26/24.
//

import SwiftUI


extension Binding where Value == Bool {
    init(value: Binding<String?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            } else {
                print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
            }
        }
    }
}

struct ContentView: View {
    
    @State private var alertMessage: String? = nil
    
    var body: some View {
        VStack {
            Button {
                // Action
                alertMessage = "알림등장"
            } label: {
                Text("알림버튼입니다")
            }
            .alert("알림title", isPresented: .init(value: $alertMessage)) {
                Button("OK버튼") {
                     
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
