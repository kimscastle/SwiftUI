//
//  Padding.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Padding: View {
    var body: some View {
//        Text("Hello, World!")
//            .padding([.top, .leading], 20)
//            .padding(.init(top: 10, leading: 20, bottom: 40, trailing: 0))
        VStack(alignment: .leading) {
            Text("Hello World!")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            Text("You guys wanna be a iOS developer? This tutorial is the answer")
        }
        .padding()
        .padding(.vertical, 20)
    }
}

#Preview {
    Padding()
}
