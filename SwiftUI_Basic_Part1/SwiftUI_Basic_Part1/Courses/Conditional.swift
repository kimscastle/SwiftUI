//
//  Conditional.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Conditional: View {
    @State var userLogin = false
    var body: some View {
        if userLogin {
            Color.yellow
        } else {
            Color.pink
        }
    }
}

#Preview {
    Conditional()
}
