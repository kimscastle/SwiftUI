//
//  BindingProperty.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct BindingProperty: View {
    @State var title = ""
    @State var isShow = false
    var body: some View {
        VStack {
            if isShow {
                Image("street")
                    .resizable()
                    .frame(height: 300)
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 300, height: 300)
                Text("")
            }
        }
        .frame(height: 500)
        toggleButton(isShow: $isShow, title: $title)
    }
}

#Preview {
    BindingProperty()
}

struct toggleButton: View {
    @Binding var isShow: Bool
    @Binding var title: String
    var body: some View {
        Button {
            isShow.toggle()
            title = "Uiseong Kim"
        } label: {
            Text("Show Profile")
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 300, height: 50)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
        }
    }
}
