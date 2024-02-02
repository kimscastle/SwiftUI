//
//  GridBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/2/24.
//

import SwiftUI

struct GridBootcamp: View {
    // grid한 줄의 모양
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 6, alignment: nil), count: 3)
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {
                Section {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section1")
                }
                
                Section {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section2")
                }


            })
        }

    }
}

#Preview {
    GridBootcamp()
}
