//
//  VideoPlayerView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct VideoPlayerView: View {
    let video: Video
    var body: some View {
        NavigationStack {
            VStack {
                YoutubeView(videoID: video.videoID)
            }
            .navigationTitle("\(video.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    VideoPlayerView(video: .sampleVideoData)
}
