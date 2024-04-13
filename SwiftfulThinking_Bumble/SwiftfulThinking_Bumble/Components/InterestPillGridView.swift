//
//  InterestPillGridView.swift
//  SwiftfulThinking_Bumble
//
//  Created by uiskim on 4/11/24.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(iconName: interest.iconName, emoji: interest.emoji, text: interest.text)
                } else {
                    EmptyView()
                }
            }

        } //:ZSTACK
    }
}

#Preview {
    VStack(spacing: 40) {
        InterestPillGridView(interests: User.mock.basics)
        InterestPillGridView(interests: User.mock.interests)
    }
}
