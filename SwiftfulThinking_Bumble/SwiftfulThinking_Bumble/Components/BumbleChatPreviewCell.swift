//
//  BumbleChatPreviewCell.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/13/24.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var userName: String = "Nick"
    var lastChatMessage: String? = "This is the last message."
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMessage: hasNewMessage
            )
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text("\(userName)")
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .clipShape(.rect(cornerRadius: 32))
                    }
                } //:HSTACK
                if let lastChatMessage {
                    Text("\(lastChatMessage)")
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            } //:VSTACK
        } //:HSTACK
        .lineLimit(1)
    }
}

#Preview {
    BumbleChatPreviewCell()
        .padding()
}
