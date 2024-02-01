//
//  SpacerBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/1/24.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
//        HStack(spacing: 0 ) {
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .frame(width: 50, height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .fill(.red)
//                .frame(width: 50, height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 50, height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//        }
//        .background(.yellow)
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal)

            Spacer()
                .frame(width: 10)
                .background(.orange)
            
            Rectangle()
                .frame(height: 50)
        }
    }
}

#Preview {
    SpacerBootcamp()
}
