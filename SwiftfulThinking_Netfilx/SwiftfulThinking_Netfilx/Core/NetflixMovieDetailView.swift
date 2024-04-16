//
//  NetflixMovieDetailView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI

struct NetflixMovieDetailView: View {
    var product: Product = .mock
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    var body: some View {
        ZStack {
            // Background Color
            Color.netflixBlack
                .ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3)
                .ignoresSafeArea()
            // Content
            
            VStack(spacing: 0) {
                NetfilxDetailHeaderView(
                    imageName: product.firstImage,
                    progress: progress) {
                        
                    } onXMarkPressed: {
                        
                    }
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        NetflixDetailProductView(
                            title: product.title,
                            isNew: true,
                            yearRelease: "2024",
                            seasonCount: 4,
                            hasClosedCaption: true,
                            isTopTen: 6,
                            descriptionText: product.description) {
                                
                            } onDownloadPressed: {
                                
                            }

                        HStack(spacing: 32) {
                            MyListButton(isMyList: isMyList) {
                                isMyList.toggle()
                            }
                            
                            RateButton { selection in
                                
                            }
                            
                            ShareButton()
                            
                        } //:HSTACK
                        .padding(.leading, 32)
                        
                        VStack(alignment: .leading) {
                            Text("More Like This")
                                .font(.headline)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
                                      alignment: .center,
                                      spacing: 8,
                                      pinnedViews: [],
                                      content: {
                                ForEach(products) { product in
                                    NetflixMovieCell(
                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentlyAdded: false,
                                        topTenRanking: nil
                                    )
                                }
                            })
                        }
                        .foregroundStyle(.netflixWhite)
                    } //:VSTACK
                    .padding(8)
                } //:SCROLL
                .scrollIndicators(.hidden)
                
            } //:VSTACK
            
        } //:ZSTACK
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            self.products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
