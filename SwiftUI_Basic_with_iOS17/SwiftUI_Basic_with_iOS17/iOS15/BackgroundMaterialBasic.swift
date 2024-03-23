//
//  BackgroundMaterialBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/23/24.
//

import SwiftUI

struct BackgroundMaterialBasic: View {
    
    let url = URL(string: "https://picsum.photos/1000")
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
                Text("Material Background 예시")
                    .font(.headline)
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
        }
        .background(
            AsyncImage(url: url) { image in
                image
            } placeholder: {
                ProgressView()
            }
        )
    }
}

#Preview {
    BackgroundMaterialBasic()
}
