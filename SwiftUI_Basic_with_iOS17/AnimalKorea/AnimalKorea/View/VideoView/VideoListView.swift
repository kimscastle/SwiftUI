//
//  VideoListView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct VideoListView: View {
    let video: Video
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .clipShape(.rect(cornerRadius: 10))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 5)
            }
            
            VStack(spacing: 10) {
                Text(video.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                    .hLeading()
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    VideoListView(video: .sampleVideoData)
}
