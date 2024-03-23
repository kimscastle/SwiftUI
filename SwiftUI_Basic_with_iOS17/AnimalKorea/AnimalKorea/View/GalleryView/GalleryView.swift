//
//  GalleryView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import SwiftUI


struct GalleryView: View {
    @ObservedObject var viewModel: AnimalViewModel
    @State var colums: [GridItem] = [.init(.flexible()),.init(.flexible()),.init(.flexible()),.init(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Image(viewModel.selecedAnimal)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.accent, lineWidth: 5)
                    }
                
                Slider(value: $viewModel.gridColumn, in: 2...4, step: 1)
                    .padding(0)
                    .onChange(of: viewModel.gridColumn) { _, newValue in
                        withAnimation(.easeInOut) {
                            self.colums = Array(repeating: .init(.flexible()), count: Int(newValue))
                        }
                    }
                
                LazyVGrid(columns: colums) {
                    ForEach(viewModel.animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 1)
                            }
                            .onTapGesture {
                                viewModel.selecedAnimal = animal.image
                            }
                    }
                }


            }
            .navigationTitle("갤러리")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GalleryView(viewModel: AnimalViewModel())
}
