//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
            } //:VSTACK
            .padding(.leading)
        } //:HSTACK
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
