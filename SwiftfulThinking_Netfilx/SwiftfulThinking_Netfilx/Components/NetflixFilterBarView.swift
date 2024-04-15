//
//  NetflixFilterBarView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "TV Show", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var selectedFilter: FilterModel? = nil
    var filters: [FilterModel] = FilterModel.mockArray
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                                .background(.black.opacity(0.001))
                                .onTapGesture {
                                    onXmarkPressed?()
                                }

                        )
                        .foregroundStyle(.netflixLightGray)
                        .transition(AnyTransition(.move(edge: .leading)))
                        .padding(.leading, 16)
                }

                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        } //:SCROLL
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct NetflixFilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        NetflixFilterBarView(
            selectedFilter: selectedFilter,
            filters: filters) { selected in
                selectedFilter = selected
            } onXmarkPressed: {
                selectedFilter = nil
            }

    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        NetflixFilterBarViewPreview()
    } //:ZSTACK

}
