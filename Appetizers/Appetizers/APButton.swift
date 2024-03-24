//
//  APButton.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    APButton(title: "testlabel")
}
