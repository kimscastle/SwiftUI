//
//  ContentView.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 150, height: 120)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(x: 50, y: 50) // Circle을 오른쪽 아래로 이동시킴
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(x: 50, y: 50) // Circle을 오른쪽 아래로 이동시킴
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(x: 50, y: 50) // Circle을 오른쪽 아래로 이동시킴
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(x: 50, y: 50) // Circle을 오른쪽 아래로 이동시킴
            
        }
    }
}

#Preview {
    ContentView()
}
