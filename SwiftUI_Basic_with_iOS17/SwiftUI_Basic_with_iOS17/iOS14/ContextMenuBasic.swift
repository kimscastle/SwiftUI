//
//  ContextMenuBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct ContextMenuBasic: View {
    @State var statusText = ""
    @State var background = Color.cyan
    var body: some View {
        VStack {
            Text(statusText)
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Context Menu Test")
                    .font(.headline)
                Text("이 버튼을 길게 누르면 메뉴가 나타납니다")
                    .font(.subheadline)
            })
            .foregroundStyle(.white)
            .padding(30)
            .background(background)
            .clipShape(.rect(cornerRadius: 20))
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                    statusText = "공유가되었습니다"
                    background = .yellow
                }, label: {
                    Label(
                        title: { Text("Share post") },
                        icon: { Image(systemName: "square.and.arrow.up") }
                    )
                })
                
                Button(action: {
                    statusText = "신고가되었습니다"
                    background = .red
                }, label: {
                    Label(
                        title: { Text("Report post") },
                        icon: { Image(systemName: "info.bubble") }
                    )
                })
                
                Button(action: {
                    statusText = "좋아요추가"
                    background = .pink
                }, label: {
                    Label(
                        title: { Text("Like") },
                        icon: { Image(systemName: "heart") }
                    )
                })

            }))
        }// :Vstack
    }
}

#Preview {
    ContextMenuBasic()
}
