//
//  ColorPickerBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct ColorPickerBasic: View {
    @State var backgroundColor = Color.green
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ColorPicker(selection: $backgroundColor, supportsOpacity: false, label: {
                Text("원하는색을 고르세요")
            })
            .padding()
            .background(.black)
            .foregroundStyle(.white)
            .font(.headline)
            .clipShape(.rect(cornerRadius: 10))
            .padding(50)
        }
    }
}

#Preview {
    ColorPickerBasic()
}
