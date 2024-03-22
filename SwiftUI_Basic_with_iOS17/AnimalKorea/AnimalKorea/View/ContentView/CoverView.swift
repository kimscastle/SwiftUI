//
//  CoverView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct CoverView: View {
    @ObservedObject var viewModel: AnimalViewModel
    var body: some View {
        TabView {
            ForEach(viewModel.coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    CoverView(viewModel: AnimalViewModel())
}
