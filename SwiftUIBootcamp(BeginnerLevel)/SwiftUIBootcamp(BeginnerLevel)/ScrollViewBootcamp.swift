//
//  ScrollViewBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/2/24.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { _ in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5) { _ in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    ScrollViewBootcamp()
}
