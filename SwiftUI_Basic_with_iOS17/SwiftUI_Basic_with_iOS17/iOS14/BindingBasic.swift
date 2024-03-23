//
//  BindingBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct BindingBasic: View {
    @State var background = Color.gray
    @State var title = "Binding Basic View"
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            // content
            VStack {
                Text(title)
                BindingChild(background: $background, title: $title)
            }//: content
        }
    }
}

struct BindingChild: View {
    @State var buttonColor = Color.blue
    @Binding var background: Color
    @Binding var title: String
    
    var body: some View {
        Button(action: {
            self.background = .orange
            self.buttonColor = .pink
            self.title = "Binding Child View"
        }, label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .clipShape(.rect(cornerRadius: 10))
        })
    }
}

#Preview {
    BindingBasic()
}
