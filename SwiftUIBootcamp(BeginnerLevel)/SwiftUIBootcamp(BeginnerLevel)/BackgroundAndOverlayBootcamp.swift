//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
//        Text("Hello, World!")
//            .background(
//                Circle()
//                    .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 100, height: 100)
//            )
//            .background(
//                Circle()
//                    .fill(LinearGradient(colors: [.blue, .red], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 120, height: 120)
//            )
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100)
//            .overlay(alignment: .center) {
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundStyle(.white)
//            }
//            .background(
//                Circle()
//                    .fill(.purple)
//                    .frame(width: 120, height: 120)
//            )
//        Rectangle()
//            .fill(.black)
//            .frame(width: 150, height: 150)
//            .overlay(alignment: .bottomTrailing) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 100, height: 100)
//            }
//            .overlay(alignment: .center) {
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: 50, height: 50)
//            }
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .purple.opacity(0.5), radius: 10, x: 0.0, y: 10)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(.black)
                            .frame(width: 35, height: 35)
                            .overlay {
                                Text("5")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            .shadow(color: .purple.opacity(0.5), radius: 10, x: 0.0, y: 10)
                    }
            )
    }
}

#Preview {
    BackgroundAndOverlayBootcamp()
}
