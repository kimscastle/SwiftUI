//
//  AlertBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct Article1 {
    var title: String
    var subtitle: String
}

struct AlertBasic: View {
    @State var showAlert1 = false
    @State var showAlert2 = false
    @State var showAlert3 = false
    @State var showAlert4 = false
    @State var text = ""
    @State var backgroundColor = Color.yellow
    
    var alert1 = Article1(title: "1번", subtitle: "1번입니다만?")
    @State var alertType: AlertCase? = nil
    
    enum AlertCase {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button(action: {
                    showAlert1.toggle()
                }, label: {
                    Text("1번 Alert")
                })
                .alert("1번 Alert", isPresented: $showAlert1) {
                    TextField(text: $text) {
                        Text("enter")
                    }
                    Button("OK") {
                        print(text)
                    }
                    Button("NO", role: .cancel) {}
                } message: {
                    Text("1번알림의 디스크립션입니다")
                }
                
                Button(action: {
                    showAlert2.toggle()
                }, label: {
                    Text("2번 Alert")
                })
            }
        }
    }
}

#Preview {
    AlertBasic()
}
