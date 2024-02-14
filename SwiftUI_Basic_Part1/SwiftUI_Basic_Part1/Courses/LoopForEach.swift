//
//  LoopForEach.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct LoopForEach: View {
    var body: some View {
        VStack {
            ForEach(0..<10, id: \.self) { _ in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    LoopForEach()
}
