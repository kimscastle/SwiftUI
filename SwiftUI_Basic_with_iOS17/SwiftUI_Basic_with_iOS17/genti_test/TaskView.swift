//
//  TaskView.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 4/1/24.
//

import SwiftUI

enum TaskState {
    case empty
}

struct TaskView: View {
    let state: TaskState = .empty
    let number: Int
    var body: some View {
        ZStack {
            // Background Color
            Color.white
                .ignoresSafeArea()
            // Content
            VStack {
                Text("\(number)")
                Image("grayfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                
                Text("현재 진행 중인 작업이 없어요")
                    .font(.title2)
                    .foregroundStyle(.gray.opacity(0.5))
                Text("작업은 별접이 높은 사람에게 우선 배정되어요")
                    .font(.caption)
                
                Spacer()
                    .frame(height: 20)
                Text("제출 제한 시간은 6시간이며,\n2시간 내로 제출시 5,500원, 4시간 내로 제출시 4,500원\n6시간 내로 제출시 3,500원이 지급되어요.")
                    .multilineTextAlignment(.center)
                    .font(.caption)
            }
            
        } //:ZSTACK
    }
}

#Preview {
    TaskView(number: 1)
}
