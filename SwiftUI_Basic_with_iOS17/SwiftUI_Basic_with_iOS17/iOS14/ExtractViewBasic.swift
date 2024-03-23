//
//  ExtractViewBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct ExtractViewBasic: View {
    @State var backgroundColor = Color.pink
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            contentLayer
        }
    }//: body
    var contentLayer: some View {
        VStack {
            Text("연습중입니다")
            Button(action: {
                buttonPressed()
            }, label: {
                Text("바탕색변경")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 10))
            })
        }
    }
    
    func buttonPressed() {
        self.backgroundColor = .yellow
    }
}

#Preview {
    ExtractViewBasic()
}
