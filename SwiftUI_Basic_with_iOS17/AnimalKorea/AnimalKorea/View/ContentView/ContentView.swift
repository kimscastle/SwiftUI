//
//  ContentView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AnimalViewModel
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    CoverView(viewModel: viewModel)
                        .frame(height: CGFloat.screenHeight*0.4)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                    ForEach(viewModel.animals) { animal in
                        NavigationLink(value: animal) {
                            AnimalListView(animal: animal)
                                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                        }

                    }

                    CreditView()
                        .hCenter()
                    
                }
                .listStyle(.plain)
                .navigationTitle("멸종 위기 동물들")
                .navigationDestination(for: Animal.self) { animal in
                    DetailView(animal: animal)
                }
            }

            
            
            if viewModel.isLoading {
                ZStack {
                    Color.gray
                        .ignoresSafeArea()
                        .opacity(0.3)
                        .frame(width: 70, height: 70)
                        .clipShape(.rect(cornerRadius: 20))
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        }
        
    }
}

#Preview {
    ContentView(viewModel: AnimalViewModel())
}
