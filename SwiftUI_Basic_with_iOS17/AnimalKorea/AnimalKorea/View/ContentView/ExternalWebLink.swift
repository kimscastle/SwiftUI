//
//  ExternalWebLink.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct ExternalWebLink: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("멸종 위기 야생생물 포털")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: URL(string: animal.link)!) {
                        Text(animal.name)
                    }
                }
            }
        }
    }
}

#Preview {
    ExternalWebLink(animal: .sampleAnimal)
}
