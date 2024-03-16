//
//  TransitionBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct TransitionBasic: View {
    @State var show = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        show.toggle()
                    }
                }, label: {
                    Text("Button")
                })
                
                Spacer()
                
                if show {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: UIScreen.main.bounds.height/2)
                        .opacity(show ? 1 : 0)
                        .transition(.move(edge: .bottom))
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    TransitionBasic()
}
