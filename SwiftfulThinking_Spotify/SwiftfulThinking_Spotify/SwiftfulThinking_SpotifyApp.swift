//
//  SwiftfulThinking_SpotifyApp.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/3/24.
//

import SwiftUI

@main
struct SwiftfulThinking_SpotifyApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                // Background Color
                Color.black
                    .ignoresSafeArea()
                // Content
//                ScrollView {
                SpotifyHomeView()
//                }
//                .ignoresSafeArea()
            } //:ZSTACK
        }
    }
}
