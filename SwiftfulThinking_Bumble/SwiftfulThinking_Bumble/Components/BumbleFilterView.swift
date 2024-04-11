//
//  BumbleFilterView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/11/24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var namespace
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8) {
                    Text("\(option)")
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }

                } //:VSTACK
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        } //:HSTACK
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterViewPreviewView: View {
    var options = ["Everyone", "Trending"]
    @State var selection = "Everyone"
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterViewPreviewView()
        .padding()
}
