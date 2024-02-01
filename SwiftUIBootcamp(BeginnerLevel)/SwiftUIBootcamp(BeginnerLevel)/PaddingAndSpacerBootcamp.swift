//
//  PaddingAndSpacerBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("this is the description of what we will do don this screen. It is multiple lines and we will align the text to the leading edgs")
        }
        // padding으로 늘어난곳까지 frame이되어서 새로운 view가 반환됨
        .padding()
        .padding(.vertical, 30)
        .background {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
        }

        .padding(.horizontal, 10)

            
    }
}

#Preview {
    PaddingAndSpacerBootcamp()
}
