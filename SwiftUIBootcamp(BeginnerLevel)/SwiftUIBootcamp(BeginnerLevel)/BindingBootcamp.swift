//
//  BindingBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/3/24.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }

        }
    }
}

#Preview {
    BindingBootcamp()
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .black
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = .orange
            buttonColor = .pink
            title = "TITLE CHANGE"
        } label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
    }
}
