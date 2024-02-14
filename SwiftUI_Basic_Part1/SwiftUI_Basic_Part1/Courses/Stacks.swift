//
//  Stacks.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
//        VStack {
//            Rectangle()
//                .fill(.indigo)
//                .frame(width: 80, height: 100)
//            
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 120, height: 150)
//            
//            Rectangle()
//                .fill(.cyan)
//                .frame(width: 160, height: 180)
//        }
//        HStack {
//            Rectangle()
//                .fill(.indigo)
//                .frame(width: 80, height: 100)
//
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 120, height: 150)
//
//            Rectangle()
//                .fill(.cyan)
//                .frame(width: 160, height: 180)
//        }
//        ZStack {
//            Rectangle()
//                .fill(.cyan)
//                .frame(width: 160, height: 180)
//
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 120, height: 150)
//
//            Rectangle()
//                .fill(.indigo)
//                .frame(width: 80, height: 100)
//        }
        VStack {
            HStack {
                Image("flowers")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Uiseong Kim")
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundStyle(.gray)
            }
            .background(.blue)
            .padding(.horizontal, 20)
            .background(.red)
            Image("pretty")
                .resizable()
                .frame(maxHeight: 400)
        }
    }
}

#Preview {
    Stacks()
}
