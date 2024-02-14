//
//  ExtractSubView.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct ExtractSubView: View {
    var body: some View {
        ScrollView {
            FeedView(userName: "hundredBack", imageFileName: "flowers")
            FeedView(userName: "uiseongKim", imageFileName: "street")
        }

    }
}

struct FeedView: View {
    let userName: String
    let imageFileName: String
    var body: some View {
        HStack {
            Image("flowers")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(userName)
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal, 12)
        Image(imageFileName)
            .resizable()
            .frame(height: 400)
    }
}

#Preview {
    ExtractSubView()
}
