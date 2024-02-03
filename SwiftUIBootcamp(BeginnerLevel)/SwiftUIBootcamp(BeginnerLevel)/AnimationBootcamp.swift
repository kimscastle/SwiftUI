//
//  AnimationBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/3/24.
//

import SwiftUI

struct AnimationBootcamp: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(Animation.default.repeatCount(3, autoreverses: true)) {
                    isAnimated.toggle()
                }

            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 25 : 50)
                .fill(isAnimated ? .red : .green)
                .frame(width: isAnimated ? 100 : 300, height: 300)
            Spacer()
        }
    }
}

#Preview {
    AnimationBootcamp()
}
