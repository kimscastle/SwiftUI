//
//  DetailGallery.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct DetailGallery: View {
    let animal: Animal
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(.rect(cornerRadius: 12))
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    DetailGallery(animal: .sampleAnimal)
}
