//
//  DetailView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct DetailView: View {
    let animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .background {
                        Color.accentColor
                            .frame(height: 5)
                            .offset(y: 25)
                    }
                
                Text(animal.headline)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.accent)
                    .padding()
                
                Group {
                    DetailHead(headImage: Image(systemName: "photo.on.rectangle.angled"), headText: "\(animal.name) 사진들")
                    
                    DetailGallery(animal: animal)
                }
                
                Group {
                    DetailHead(headImage: Image(systemName: "info.circle"), headText: "자세한정보")
                    Text(animal.description)
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                }
                
                Group {
                    DetailHead(headImage: Image(systemName: "location.magnifyingglass"), headText: "팩트체크")
                    DetailFact(animal: animal)
                }
                
                Group {
                    DetailHead(headImage: Image(systemName: "books.vertical"), headText: "참고 자료")
                    ExternalWebLink(animal: animal)
                }
                
                Text(animal.copyright)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                
            }
            .navigationTitle("\(animal.name) 자세히알아보기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailView(animal: .sampleAnimal)
}
