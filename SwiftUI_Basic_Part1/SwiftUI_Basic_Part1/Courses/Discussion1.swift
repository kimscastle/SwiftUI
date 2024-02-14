//
//  Discussion1.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Discussion1: View {
    var body: some View {
        //frame
//        Image(systemName: "star.fill")
//            .font(.system(size: 60))
//            .frame(maxWidth: .infinity,
//                   maxHeight: .infinity,
//                   alignment: .bottomTrailing)
        //stacks
//        VStack {
//            Spacer()
//            HStack {
//                Spacer()
//                Image(systemName: "star.fill")
//                    .font(.system(size: 60))
//            }
//        }
        
        //overlay
        Color.white
            .overlay(alignment: .bottomTrailing) {
                Image(systemName: "star.fill")
                    .font(.system(size: 60))
            }
    }
}

#Preview {
    Discussion1()
}
