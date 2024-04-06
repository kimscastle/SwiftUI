//
//  SpotifyRecentCell.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/6/24.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        } //:HSTACK
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(.rect(cornerRadius: 6))
        .themeColor(isSelected: false)
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            } //:HSTACK
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            } //:HSTACK
        } //:VSTACK
    } //:ZSTACK

}
