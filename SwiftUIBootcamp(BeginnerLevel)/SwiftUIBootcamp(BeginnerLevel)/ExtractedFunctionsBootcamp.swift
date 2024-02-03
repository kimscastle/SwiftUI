//
//  ExtractedFunctionsBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/3/24.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
    
    @State var backgroundColor: Color = .yellow
    
    var body: some View {
        contentLayer
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Color.black
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    )
            })
        }
        .wholeBackground(color: backgroundColor)
    }
    
    func buttonPressed() {
        backgroundColor = .pink
    }
}

#Preview {
    ExtractedFunctionsBootcamp()
}
