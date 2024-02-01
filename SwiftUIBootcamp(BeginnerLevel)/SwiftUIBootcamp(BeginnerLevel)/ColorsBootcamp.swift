//
//  ColorsBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("CustomColor"))
            .frame(width: 300, height: 200)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -10, y: -10)
    }
}

#Preview {
    ColorsBootcamp()
}
