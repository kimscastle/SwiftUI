//
//  SheetBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct SheetBasic: View {
    @State var show = false
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            NavigationStack {
                NavigationLink {
                    SheetBasic2()
                } label: {
                    Text("Button")
                }
                .navigationTitle("dkdk")
                
                NavigationLink {
                    SheetBasic2()
                } label: {
                    Text("Button")
                }
                .navigationTitle("ㅁㄴㄹㄴㄹㄴ")

            }
 



            // Content
//            Button(action: {
//                show.toggle()
//            }, label: {
//                Text("Button")
//                    .foregroundStyle(.green)
//                    .font(.headline)
//                    .padding()
//                    .background(.white)
//                    .clipShape(.rect(cornerRadius: 10))
//            })
//            .fullScreenCover(isPresented: $show, content: {
//                SheetBasic2()
//            })
        }
    }
}

#Preview {
    SheetBasic()
}
