//
//  AddingText.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct AddingText: View {
    var body: some View {
        Text("Hello, World!")
            .underline(true, color: .yellow)
            .strikethrough(color: .red)
            .baselineOffset(10.0)
            .kerning(3)
            .font(.system(size: 40, weight: .bold))
    }
}

#Preview {
    AddingText()
}
