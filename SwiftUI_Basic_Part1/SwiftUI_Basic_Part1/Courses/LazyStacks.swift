//
//  LazyStacks.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct LazyStacks: View {
    var body: some View {
        ScrollView {
//            LazyVStack {
//                ForEach(0..<1000, id: \.self) { _ in
//                    RoundedRectangle(cornerRadius: 25)
//                        .fill(.yellow)
//                        .frame(width: 300, height: 200)
//                }
//            }
            LazyVStack(alignment: .center, spacing: nil, pinnedViews: .sectionHeaders, content: {
                Section {
                    ForEach(1...10, id: \.self) { count in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 350, height: 200)
                    }
                } header: {
                    Text("header입니다")
                        .font(.largeTitle)
                }


            })
        }
    }
}

#Preview {
    LazyStacks()
}
