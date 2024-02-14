//
//  Buttons.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Buttons: View {
    @State var shapeColor = Color.red
    var body: some View {
        VStack(spacing: 50) {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(shapeColor)
                .frame(width: 200, height: 100)
            
            Button("Change") {
                shapeColor = .orange
            }
            
            Button {
                shapeColor = .blue
            } label: {
                Text("ColorChanger")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.pink)
                    .cornerRadius(10)
            }
            
            Button {
                shapeColor = .cyan
            } label: {
                Image(systemName: "pencil.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.green)
                    .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    Buttons()
}
