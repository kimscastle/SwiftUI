//
//  NetfilxHomeView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI

struct NetfilxHomeView: View {
    var body: some View {
        ZStack {
            // Background Color
            Color.netflixBlack
                .ignoresSafeArea()
            // Content
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("For You")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                } //:HSTACK
                
            } //:VSTACK
        } //:ZSTACK
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    NetfilxHomeView()
}
