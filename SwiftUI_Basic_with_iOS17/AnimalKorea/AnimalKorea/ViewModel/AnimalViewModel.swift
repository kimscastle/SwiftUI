//
//  AnimalViewModel.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import Foundation

final class AnimalViewModel: ObservableObject {
    @Published var animals: [Animal] = []
    @Published var coverImages: [CoverImage] = []
    @Published var videos: [Video] = []
    @Published var selecedAnimal = "tiger" //image name
    @Published var gridColumn: Double = 4.0
    @Published var isLoading = false

    
    init() {
        self.getAnimals()
        self.getCoverImages()
        self.getVideos()
    }
    
    func getAnimals() {
        self.animals = Bundle.main.decode("animals.json")
    }
    
    func getCoverImages() {
        self.coverImages = Bundle.main.decode("covers.json")
    }
    
    func getVideos() {
        self.videos = Bundle.main.decode("videos.json")
    }
}
