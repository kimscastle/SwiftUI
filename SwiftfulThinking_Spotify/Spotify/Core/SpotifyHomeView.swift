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
    @State private var productRow: [ProductRow] = []
    
    var body: some View {
        NavigationStack {
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
                                    .padding(.horizontal, 16)
                                
                                if let product = products.first {
                                    newReleaseSection(product: product)
                                        .padding(.horizontal, 16)
                                }
                                
                                listRow
                                
                            } //:VSTACK
                            
                        } header: {
                            header
                        }
                    } //:VSTACK
                    .padding(.top, 8)
                } //:SCROLL
                .scrollIndicators(.hidden)
                .clipped()
                .navigationDestination(for: Product.self) { product in
                    SpotifyPlaylistView()
                }
                
                
            } //:ZSTACK
            .task {
                await getData()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map{ $0.brand })
            for brand in allBrands {
                rows.append(.init(title: brand.capitalized, products: products))
            }
            productRow = rows
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
        LazyVGrid(columns: [.init(.flexible()), .init(.flexible())],
                  alignment: .center,
                  spacing: 10,
                  content: {
            ForEach(products) { product in
                NavigationLink(value: product) {
                    SpotifyRecentCell(
                        imageName: product.firstImage,
                        title: product.title
                    )
                }
                .asButton(.press)
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
    
    var listRow: some View {
        ForEach(productRow) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            NavigationLink(value: product) {
                                ImageTitleRowCell(imageSize: 120, imageName: product.firstImage, title: product.title)
                            }
                            
                            .asButton(.press)
                            
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    SpotifyHomeView()
}
