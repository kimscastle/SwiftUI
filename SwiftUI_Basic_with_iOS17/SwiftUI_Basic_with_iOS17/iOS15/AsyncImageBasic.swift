//
//  AsyncImageBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/23/24.
//

import SwiftUI

struct AsyncImageBasic: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        VStack(spacing: 20) {
            // 일반적인 AsyncImage사용 with ProgressView
            Text("1. 일반적인 AsyncImage 사용예시")
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(.rect(cornerRadius: 20))
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            
            Divider()
            
            Text("2. switch를 통한 Image error처리")
            AsyncImage(url: url) { raw in
                switch raw {
                case .empty:
                    ProgressView()
                        .frame(width: 200, height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                case .failure:
                    Text("이미지가 로드되지않았습니다")
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    AsyncImageBasic()
}
