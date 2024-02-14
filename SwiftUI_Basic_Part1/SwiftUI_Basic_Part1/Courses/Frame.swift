//
//  Frame.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Frame: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
//            .background(.blue)
//            .frame(width: 300, height: 100, alignment: .center)
//            .background(.yellow)
//            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 100, idealHeight: 150, maxHeight: 200, alignment: .topLeading)
//            .background(.blue)
            .frame(width: 100)
            .background(.yellow)
            .frame(maxWidth: 300)
            .background(.red)
            .frame(maxWidth: .infinity)
            .background(.green)
            .frame(height: 150)
            .background(.purple)
            .frame(maxHeight: 400)
            .background(.gray)
            .frame(maxHeight: .infinity)
            .background(.cyan)
    }
}

#Preview {
    Frame()
}
