//
//  StateBootscamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/3/24.
//

import SwiftUI

struct StateBootscamp: View {
    // view가 해당변수의 변화를 감지할지를 알려주는 어노테이션
    // view야 이 변수감지하고있어
    // 이게 바뀌면 뷰 다시그려야해...
    @State var backgroundColor: Color = .green
    @State var myTitle = "My Title"
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text(myTitle)
                .font(.title)
            Text("Count : \(count)")
                .font(.headline)
                .underline()
            
            HStack(spacing: 20) {
                Button("Button 1") {
                    backgroundColor = .red
                    myTitle = "Button 1 was pressed"
                    count += 1
                }
                Button("Button 2") {
                    backgroundColor = .purple
                    myTitle = "Button 2 was pressed"
                    count -= 1
                }
            }
        }
        .wholeBackground(color: backgroundColor)
        .foregroundStyle(.white)
    }
}

#Preview {
    StateBootscamp()
}

extension VStack {
    @ViewBuilder
    func wholeBackground(color: Color) -> some View {
        self.frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        .background(color)
    }
}
