//
//  RateButton.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/16/24.
//

import SwiftUI

enum RateOption: CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike:
            "Not for me"
        case .like:
            "I like this"
        case .love:
            "Love this!"
        }
    }
    
    var icon: String {
        switch self {
        case .dislike:
            "hand.thumbsdown"
        case .like:
            "hand.thumbsup"
        case .love:
            "heart.fill"
        }
    }
}

struct RateButton: View {
    
    @State private var showPopover: Bool = false
    var onRatingSelected: ((RateOption) -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.thumbsup")
                .font(.title)
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        } //:VSTACK
        .foregroundColor(.netflixWhite)
        .padding(8)
        .background(.black.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover, content: {
            ZStack {
                // Background Color
                Color.netflixDarkGray
                    .ignoresSafeArea()
                // Content
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                } //:HSTACK
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            } //:ZSTACK
            .presentationCompactAdaptation(.popover)
        })
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.icon)
                .font(.title2)
            Text("\(option.title)")
                .font(.caption)
            
        } //:VSTACK
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(.black.opacity(0.001))
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option)
        }
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        RateButton()
    } //:ZSTACK

}
