//
//  SplashView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            TabbarView()
        } else {
            VStack(spacing: 20) {
                Image("splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("한국의 멸종위기 동물들")
                    .font(.largeTitle)
                    .foregroundStyle(.accent.opacity(0.5))
                    .fontWeight(.heavy)
            }//: Vstack
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    size = 1
                    opacity = 1
                    // 1.5초동안 애니메이션되는동안 delay되기때문에
                    // 애니메이션끝나고 3-1.5초간 보여지고 넘어감
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
