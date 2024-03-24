//
//  AppetizerRemoteImage.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    func load(url: String) {
        NetworkManger.shared.downloadImage(from: url) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.load(url: urlString)
            }
    }
}
