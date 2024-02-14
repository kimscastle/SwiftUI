//
//  IgnoreSafeAreaLayout.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct IgnoreSafeAreaLayout: View {
    var body: some View {
        VStack {
            Image("street")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .bottom)
                
            Text("Kim Uiseong")
                .font(.system(size: 30, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            Spacer()
        }
    }
}

#Preview {
    IgnoreSafeAreaLayout()
}
