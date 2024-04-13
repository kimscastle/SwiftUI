//
//  BumbleCardView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/11/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    var user: User = .mock
    var onSuperLikePressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    var onCheckmarkPressed: (() -> Void)? = nil
    var onSendComplimentPressed: (() -> Void)? = nil
    var onHideAndReportPressed: (() -> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
                aboutMeSection
                    .padding(24)
                myInterestSection
                    .padding(24)
                

                
                ForEach(user.images, id: \.self) { image in
                    ImageLoaderView(urlString: image)
                        .frame(height: cardFrame.height)
                }
                
                locationSection
                    .padding(24)
                
                footerSection
                    .padding(.vertical, 60)
                    .padding(.horizontal, 32)

            } //:VSTACK
        } //:SCROLL
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .overlay(alignment: .bottomTrailing) {
            likeButton
                .padding(24)
        }
        .clipShape(.rect(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private var likeButton: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay {
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            }
            .onTapGesture {
                onSuperLikePressed?()
            }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text("\(title)")
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text("\(user.work)")
                } //:HSTACK
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text("\(user.education)")
                } //:HSTACK
                
                BumbleHeartView()
                    .onTapGesture {
                        
                    }
                
            } //:VSTACK
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        } //:ZSTACK
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle(title: "About Me")
            Text("\(user.aboutMe)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0) {
                BumbleHeartView()
                Text("Send a Compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            } //:HSTACK
            .padding(.horizontal, 8)
            .padding(.trailing, 8)
            .background(.bumbleYellow)
            .clipShape(.rect(cornerRadius: 32))
            .onTapGesture {
                onSendComplimentPressed?()
            }
        } //:VSTACK
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterestSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 12) {
                sectionTitle(title: "My basic")
                InterestPillGridView(interests: user.basics)
            } //:VSTACK
            
            VStack(alignment: .leading, spacing: 12) {
                sectionTitle(title: "My interests")
                InterestPillGridView(interests: user.interests)
            } //:VSTACK
            
        } //:VSTACK
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("\(user.firstName)" + "'s Location", systemImage: "mappin.and.ellipse.circle.fill")
                .foregroundStyle(.bumbleGray)
                .font(.body)
                .fontWeight(.medium)
            
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            InterestPillView(iconName: nil, emoji: "🇺🇸", text: "Lives in New York, NY")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var footerSection: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckmarkPressed?()
                    }
            } //:HSTACK
            
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
            
        } //:VSTACK
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        BumbleCardView()
            .padding(.vertical, 40)
            .padding(.horizontal, 16)
    } //:ZSTACK

}
