//
//  ShareButton.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/16/24.
//

import SwiftUI

struct ShareButton: View {
    
    var url: String = "https://www.swiftful-thinking.com"
    
    @ViewBuilder
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                    
                } //:VSTACK
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(.black.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        ShareButton()
    } //:ZSTACK

}
