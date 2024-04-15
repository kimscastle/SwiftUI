//
//  NetflixFilterCell.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Category"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text("\(title)")
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        } //:HSTACK
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)

                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        VStack {
            NetflixFilterCell()
            NetflixFilterCell(isSelected: true)
            NetflixFilterCell(isDropdown: false)
        }
    } //:ZSTACK

}
