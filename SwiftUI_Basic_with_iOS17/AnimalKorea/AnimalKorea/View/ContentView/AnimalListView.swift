//
//  AnimalListView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct AnimalListView: View {
    let animal: Animal
    var body: some View {
        HStack(spacing: 20) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(.rect(cornerRadius: 12))
            
            VStack(spacing: 0) {
                Text(animal.name)
                    .hLeading()
                    .font(.title)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing, 10)
            }
        }
    }
}

#Preview {
    AnimalListView(animal: .sampleAnimal)
}
