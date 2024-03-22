//
//  DetailHead.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct DetailHead: View {
    let headImage: Image
    let headText: String
    var body: some View {
        HStack {
            headImage
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headText)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    DetailHead(headImage: Image(systemName: "heart.fill"), headText: "fsf")
}
