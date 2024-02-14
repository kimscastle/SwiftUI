//
//  Symbols.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Symbols: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.system(size: 40))
                .foregroundStyle(.pink)
            
            Image(systemName: "house.fill")
                .resizable()
                .foregroundStyle(.purple)
                .frame(width: 200, height: 200)
            
            Image(systemName: "externaldrive.fill.badge.plus")
            // 전체색깔
//                .renderingMode(.template)
            // 부분색깔
                .renderingMode(.original)
                .foregroundStyle(.pink)
            
        }
    }
}

#Preview {
    Symbols()
}
