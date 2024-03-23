//
//  ActionSheetBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct ActionSheetBasic: View {
    @State var showActionSheet = false
    @State var resultActionSheet = ""
    
    var body: some View {
        VStack {
            makeCardView()
        }//: Vstack
        .confirmationDialog("a",isPresented: $showActionSheet, titleVisibility: .visible) {
            Button(action: {
                resultActionSheet = "공유되었습니다"
            }, label: {
                Text("공유하기")
            })
            
            Button(role: .destructive) {
                resultActionSheet = "삭제되었습니다"
            } label: {
                Text("공유하기")
            }
            
        } message: {
            Text("본분")
        }

    }
    
    @ViewBuilder
    func makeCardView() -> some View {
        Text(resultActionSheet)
            .font(.largeTitle)
        
        Spacer()
        HStack {
            Circle()
                .frame(width: 30, height: 30)
            Text("kimscastle")
            Spacer()
            Button(action: {
                showActionSheet.toggle()
            }, label: {
                Image(systemName: "ellipsis")
            })
        }
        .padding(.horizontal)
        
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
        
        Spacer()
    }
}

#Preview {
    ActionSheetBasic()
}
