//
//  SpotifyPlaylistView.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/7/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    init() {
        print("SpotifyPlaylistView생성")
    }
    
    var body: some View {
        ZStack {
            // Background Color
            Color.spotifyBlack
                .ignoresSafeArea()
            // Content
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }

                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: nil,
                            onElipsisPressed: nil
                        )
                        .padding(.leading, 16)
                    }
                } //:VSTACK
            }
            .scrollIndicators(.hidden)

            headerView
                .frame(maxHeight: .infinity, alignment: .top)
        } //:ZSTACK
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
    private var headerView: some View {
        ZStack {
            Text("\(product.title)")
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)

            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? .black.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .foregroundStyle(.spotifyWhite)
                .onTapGesture {
                    dismiss()
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .background(showHeader ? .spotifyBlack : .clear)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
}

#Preview {
    SpotifyPlaylistView()
}
