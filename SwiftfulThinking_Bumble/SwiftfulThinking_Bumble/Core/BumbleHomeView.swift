//
//  BumbleHomeView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/11/24.
//

import SwiftUI

struct BumbleHomeView: View {
    
    var options = ["Everyone", "Trending"]
    @State var selection = "Everyone"
    
    var body: some View {
        ZStack {
            // Background Color
            Color.bumbleWhite
                .ignoresSafeArea()
            // Content
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: options, selection: $selection)
                    .background(Divider(), alignment: .bottom)
                Spacer()
            } //:VSTACK
            .padding(8)
        } //:ZSTACK
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            } //:HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        } //:HSTACK
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHomeView()
}
