//
//  ImageLoaderView.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/3/24.
//

import SwiftUI

import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    // 해당 layer의 터치이벤트 없앰
                    // 뒤에있는 rectangle로 이벤트가 감
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
////        .clipShape(.rect(cornerRadius: 30))
//        .padding(40)
//        .padding(.vertical, 60)
}
