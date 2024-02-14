//
//  StateProperty.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct StateProperty: View {
    @State var width: CGFloat = 200
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.yellow)
                .frame(width: width, height: 100)
            Text("@State")
                .font(.title)
        }
        HStack(spacing: 50) {
            Button {
                width -= 10
            } label: {
                Text("-")
                    .foregroundStyle(.white)
                    .font(.system(size: 30, weight: .semibold))
                    .frame(width: 50, height: 50)
                    .background(.pink)
                    .clipShape(Circle())
            }
            
            Button {
                width += 10
            } label: {
                Text("+")
                    .foregroundStyle(.white)
                    .font(.system(size: 30, weight: .semibold))
                    .frame(width: 50, height: 50)
                    .background(.pink)
                    .clipShape(Circle())
            }
            
        }
    }
}

#Preview {
    StateProperty()
}
