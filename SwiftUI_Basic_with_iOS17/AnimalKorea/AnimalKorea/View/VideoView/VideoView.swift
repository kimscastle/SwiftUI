//
//  VideoView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel: AnimalViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.videos) { video in
                    NavigationLink {
                        VideoPlayerView(video: video)
                    } label: {
                        VideoListView(video: video)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("비디오")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    VideoView(viewModel: AnimalViewModel())
}
