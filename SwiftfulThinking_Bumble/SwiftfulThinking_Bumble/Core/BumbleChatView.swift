//
//  BumbleChatView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/13/24.
//

import SwiftUI

struct BumbleChatView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            // Background Color
            Color.bumbleWhite
                .ignoresSafeArea()
            // Content
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                
                recentSection
            } //:VSTACK
        } //:ZSTACK
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    dismiss()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        } //:HSTACK
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }  //:GROUP
            .padding(.horizontal, 16)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            } //:SCROLL
            .scrollIndicators(.hidden)
            .frame(height: 100)
        } //:VSTACK

        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Group {
                    Text("Match Queue")
                    +
                    Text(" (\(allUsers.count))")
                        .foregroundStyle(.bumbleGray)
                }
                .padding(.horizontal, 16)
                Spacer(minLength: 0)
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            } //:SCROLL
            .scrollIndicators(.hidden)
        } //:VSTACK
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
    
}

#Preview {
    BumbleChatView()
}
