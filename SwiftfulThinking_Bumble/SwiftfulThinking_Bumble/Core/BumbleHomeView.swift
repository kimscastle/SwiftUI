//
//  BumbleHomeView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/11/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    var options = ["Everyone", "Trending"]
    @State var selection = "Everyone"
    
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffset: [Int:Bool] = [:]
    @State private var currenSwipeOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                Color.bumbleWhite
                    .ignoresSafeArea()
                // Content
                VStack(spacing: 12) {
                    header
                    BumbleFilterView(options: options, selection: $selection)
                        .background(Divider(), alignment: .bottom)
                    
                    ZStack {
                        if !allUsers.isEmpty {
                            ForEach(Array(allUsers.enumerated()), id: \.offset) {
                                index,
                                user in
                                let offsetValue = cardOffset[user.id]
                                let isPrevious = (selectedIndex - 1) == index
                                let isCurrent = selectedIndex == index
                                let isNext = (selectedIndex + 1) == index
                                if isPrevious || isCurrent || isNext {
                                    BumbleCardView(
                                        user: user,
                                        onSuperLikePressed: nil,
                                        onXmarkPressed: {
                                            userDidSelect(
                                                index: index,
                                                isLike: false
                                            )
                                        },
                                        onCheckmarkPressed: {
                                            userDidSelect(
                                                index: index,
                                                isLike: false
                                            )
                                        },
                                        onSendComplimentPressed: nil,
                                        onHideAndReportPressed: nil
                                    )
                                        .withDragGesture(.horizontal, minimumDistance: 20, resets: true, rotationMultiplier: 1.05, onChanged: { dragOffset in
                                            currenSwipeOffset = dragOffset.width
                                        }, onEnded: { dragOffset in
                                            if dragOffset.width < -100 {
                                                userDidSelect(index: index, isLike: false)
                                            } else if dragOffset.width > 100 {
                                                userDidSelect(index: index, isLike: true)
                                            }
                                        })

                                        .zIndex(Double(allUsers.count - index))
                                        .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                                }
                            }

                        } else {
                            ProgressView()
                        }
                        
                        ZStack {
                            Circle()
                                .fill(.bumbleGray.opacity(0.4))
                                .overlay {
                                    Image(systemName: "xmark")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 60, height: 60)
                                .scaleEffect(abs(currenSwipeOffset) > 100 ? 1.5 : 1.0)
                                .offset(x: min(-currenSwipeOffset, 150))
                                .offset(x: -100)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Circle()
                                .fill(.bumbleGray.opacity(0.4))
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 60, height: 60)
                                .scaleEffect(abs(currenSwipeOffset) > 100 ? 1.5 : 1.0)
                                .offset(x: max(-currenSwipeOffset, -150))
                                .offset(x: 100)
                                .frame(maxWidth: .infinity, alignment: .trailing)

                            
                        }
                        .animation(.smooth, value: currenSwipeOffset)
                        .zIndex(9999)
                    } //:ZSTACK
                    .frame(maxHeight: .infinity)
                    .padding(4)
                    .animation(.smooth, value: cardOffset)
                    

                } //:VSTACK
                .padding(8)
            } //:ZSTACK
            .task {
                await getData()
            }
            .toolbar(.hidden, for: .navigationBar)
        }

    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let user = allUsers[index]
        cardOffset[user.id] = isLike
        
        selectedIndex += 1
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                NavigationLink {
                    BumbleChatView()
                } label: {
                    Image(systemName: "arrow.uturn.left")
                        .padding(8)
                        .background(.black.opacity(0.001))
                }


            } //:HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        } //:HSTACK
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHomeView()
}
