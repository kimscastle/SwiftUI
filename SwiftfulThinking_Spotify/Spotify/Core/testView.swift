//
//  testView.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/7/24.
//

import SwiftUI

struct testView: View {
    var body: some View {
        LazyVStack {
            GeometryReader(content: { geometry in
                Rectangle()
                    .frame(height: 200)
            })
            
            Text("owjefoiwjefio")
        }
        
    }
}

#Preview {
    testView()
}
