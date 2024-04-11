//
//  SongRowCell.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/7/24.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some song name goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(title)")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text("\(subtitle)")
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            } //: VSTACK
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundColor(.spotifyWhite)
                .padding(16)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onElipsisPressed?()
                }
        } //:HSTACK
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    } //:ZSTACK

}
