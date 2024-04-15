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
    
    @State private var heroProduct: Product? = nil
    
    @State private var currentUser: User? = nil
    @State private var productRow: [ProductRow] = []
    
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background Color
            Color.netflixBlack
                .ignoresSafeArea()
            // Content
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        NetflixHeroCell(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.category.capitalized, heroProduct.brand]) {
                                
                            } onPlayPressed: {
                                
                            } onMyListPressed: {
                                
                            }
                            .padding(24)

                    }

                    
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 200)
                    }
                    
                } //:VSTACK
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    selectedFilter: selectedFilter,
                    filters: filters) { selected in
                        selectedFilter = selected
                    } onXmarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
            } //:VSTACK
            .background(.blue)
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
            
            

            
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
}

#Preview {
    NetfilxHomeView()
}
