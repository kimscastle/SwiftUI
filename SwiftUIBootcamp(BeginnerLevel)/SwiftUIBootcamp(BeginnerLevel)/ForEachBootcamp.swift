//
//  ForEachBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/2/24.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["Hi", "Hello", "Hey"]
    let myString = "Hello"
    
    var body: some View {
        VStack {
            // 이렇게하면 안됌
//            ForEach(data.indices) { index in
//                Text("\(index)")
//            }
            ForEach(0..<3) { index in
                Text("\(index)")
            }
        }
    }
}

#Preview {
    ForEachBootcamp()
}
