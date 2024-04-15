//
//  NetfilxHomeView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI

struct NetfilxHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ZStack {
            // Background Color
            Color.netflixBlack
                .ignoresSafeArea()
            // Content
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
                
                Spacer()
                
            } //:VSTACK
        } //:ZSTACK
        .foregroundStyle(.netflixWhite)
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
