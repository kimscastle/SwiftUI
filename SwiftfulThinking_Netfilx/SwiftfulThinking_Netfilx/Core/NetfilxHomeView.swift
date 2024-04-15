//
//  NetfilxHomeView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI
import SwiftfulUI

struct NetfilxHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    @State private var scrollViewOffset: CGFloat  = 0
    
    @State private var heroProduct: Product? = nil
    
    @State private var currentUser: User? = nil
    @State private var productRow: [ProductRow] = []
    
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Color
            Color.netflixBlack
                .ignoresSafeArea()
            
            backgroundGradientLayer
            
            // Content
            scrollViewLayer
            fullHeaderWithFilter
        } //:ZSTACK
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        guard productRow.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            var rows: [ProductRow] = []
            let allBrands = Set(products.map{ $0.brand })
            for brand in allBrands {
                rows.append(.init(title: brand.capitalized, products: products))
            }
            productRow = rows
        } catch {
            
        }
    }
    
    private var backgroundGradientLayer: some View {
        ZStack {
            LinearGradient(colors: [.netflixDarkGray.opacity(1), .netflixDarkGray.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.netflixDarkRed.opacity(0.8), .netflixDarkRed.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
        .frame(maxHeight: max(10, 400 + (scrollViewOffset*0.75)))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    
    private var fullHeaderWithFilter: some View {
        VStack(spacing: 0) {
            header
                .padding(.horizontal, 16)
            
            if scrollViewOffset > -20 {
                NetflixFilterBarView(
                    selectedFilter: selectedFilter,
                    filters: filters) { selected in
                        selectedFilter = selected
                    } onXmarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }

        } //:VSTACK
        .padding(.bottom, 8)
        .background(
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        )
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            // 처음에만 읽음
            // NetflixFilterBarView가 사라지면 @State가 바뀌는바람에 새로그려짐
            if fullHeaderSize == .zero {
                fullHeaderSize = frame.size
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            } //:HSTACK
            .font(.title2)
        } //:HSTACK
    }
    
    private var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        heroCell(product: heroProduct)
                    }
                    categortRows
                } //:VSTACK
            } onScrollChanged: { origin in
                scrollViewOffset = min(0, origin.y)
            }
    }
    
    private func heroCell(product: Product) -> some View {
        NetflixHeroCell(
            imageName: product.firstImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.category.capitalized, product.brand]) {
                
            } onPlayPressed: {
                
            } onMyListPressed: {
                
            }
            .padding(24)
    }
    
    private var categortRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(productRow.enumerated()), id: \.offset) { rowIndex, row in
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(row.title)")
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { index, product in
                                NetflixMovieCell(
                                    imageName: product.firstImage,
                                    title: product.title,
                                    isRecentlyAdded: true,
                                    topTenRanking: rowIndex == 1 ? index+1 : nil
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                    
                } //:VSTACK
            }
        }
    }
}

#Preview {
    NetfilxHomeView()
}
