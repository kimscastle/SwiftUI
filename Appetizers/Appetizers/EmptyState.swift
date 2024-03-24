//
//  EmptyState.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            // Background Color
            Color(.systemBackground)
                .ignoresSafeArea()
            // Content
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            } //:VSTACK
            .offset(y: -50)
        } //:ZSTACK
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "test text")
}
