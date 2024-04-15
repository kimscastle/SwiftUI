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
                    VStack(spacing: 16) {
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

                        
                    } //:VSTACK
                    .padding(8)
                }
                .scrollIndicators(.hidden)
                
            } //:VSTACK
            
        } //:ZSTACK
    }
}

#Preview {
    NetflixMovieDetailView()
}
