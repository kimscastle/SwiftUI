//
//  SpotifyHomeView.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/6/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            // Background Color
            Color.spotifyBlack
                .ignoresSafeArea()
            // Content
            ScrollView {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 16) {
                            recentSection
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }
                            

                        } //:VSTACK
                        .padding(.horizontal, 16)
                    } header: {
                        header
                    }
                } //:VSTACK
                .padding(.top, 8)
            } //:SCROLL
            .scrollIndicators(.hidden)
            .clipped()

        } //:ZSTACK
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
}

private extension SpotifyHomeView {
    var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser{
                    ImageLoaderView(urlString: currentUser.image)

                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)

            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                } //:HSTACK
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        } //:HSTACK
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
        
    }
    
    var recentSection: some View {
        LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], alignment: .center, spacing: 10, content: {
            ForEach(products) { product in
                SpotifyRecentCell(imageName: product.firstImage, title: product.title)
            }
        })
    }
    
    func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                print("추가버튼눌림")
            } onPlayPressed: {
                print("플레이버튼눌림")
            }
    }
}

#Preview {
    SpotifyHomeView()
}
