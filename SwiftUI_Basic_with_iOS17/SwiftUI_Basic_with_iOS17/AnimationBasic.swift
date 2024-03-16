//
//  AnimationBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct AnimationBasic: View {
    // property
    @State var isAnimated = false
    var body: some View {
        VStack {
            Button(action: {
                isAnimated.toggle()
            }, label: {
                Text("Button")
            })
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 0)
                .fill(isAnimated ? .red : .green)
                .frame(width: isAnimated ? 100 : 300, height: isAnimated ? 100 : 300)
                .rotationEffect(.degrees(isAnimated ? 360 : 0))
                .offset(y: isAnimated ? -300 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: isAnimated)
            
        }
    }
}

#Preview {
    AnimationBasic()
}
