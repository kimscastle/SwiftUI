//
//  SheetBasic2.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct SheetBasic2: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
            })
        }
    }
}

#Preview {
    SheetBasic2()
}
