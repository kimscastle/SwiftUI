//
//  Images.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Images: View {
    var body: some View {
        // 이미지자체는 원본이미지
        Image("flowers")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
//            .cornerRadius(300/2)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    Images()
}
