//
//  SpotifyNewReleaseCell.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/6/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New relase from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    
    var onAddToPlaylistPressed: (() ->  Void)? = nil
    var onPlayPressed: (() ->  Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text("\(headline)")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text("\(subheadline)")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                    
                } //:VSTACK
            } //:HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text("\(title)")
                                .fontWeight(.semibold)
                        }
                        
                        if let subtitle {
                            Text("\(subtitle)")
                                .foregroundStyle(.spotifyLightGray)
                        }
                    } //:VSTACK
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(5)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -5)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title)
                            .onTapGesture {
                                onPlayPressed?()
                            }
                    } //:HSTACK
                } //:VSTACK
                .padding(.trailing, 16)

                    
            } //:HSTACK
            .themeColor(isSelected: false)
            .clipShape(.rect(cornerRadius: 9))
            .onTapGesture {
                onPlayPressed?()
            }
        } //:VSTACK
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        SpotifyNewReleaseCell()
            .padding()
    } //:ZSTACK

}
