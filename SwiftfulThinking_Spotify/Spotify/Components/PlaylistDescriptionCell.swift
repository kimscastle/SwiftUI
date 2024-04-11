//
//  PlaylistDescriptionCell.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/7/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var descriptionText: String = Product.mock.description
    var userName: String = "Nick"
    var subheadline: String = "Some headline goes here"
    
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text("\(descriptionText)")
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text("\(subheadline)")

            buttonsRow
        })
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text("\(userName)")
                .bold()
                .foregroundStyle(.spotifyWhite)
        } //:HSTACK
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
            } //:HSTACK
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                         
                    }
                
            } //:HSTACK
            .foregroundStyle(.spotifyGreen)
            
        } //:HSTACK
        .font(.title2)
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        PlaylistDescriptionCell()
            .padding()
    } //:ZSTACK

}
