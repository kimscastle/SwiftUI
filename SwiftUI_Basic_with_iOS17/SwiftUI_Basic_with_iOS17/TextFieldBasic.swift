//
//  TextFieldBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct TextFieldBasic: View {
    @State var inputText = ""
    @State var userNameData: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("최소 2글자 이상 입력", text: $inputText)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 10))
                    .font(.headline)
                
                Button(action: {
                    // 이름이 두글자이상일때 버튼이 활성화되도록
                    if isTextEnough {
                        saveText()
                    }
                }, label: {
                    Text("save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isTextEnough ? .blue : .gray)
                        .clipShape(.rect(cornerRadius: 10))
                        .foregroundStyle(.white)
                        .font(.headline)
                })
                .disabled(!isTextEnough)
                
                ForEach(userNameData, id: \.self) { name in
                    Text(name)
                }
                
                Spacer()
            }//: Vstack
            .padding()
            .navigationTitle("키미노 나마에와")
        }//: NavigationStack
    }//: Body
    
    var isTextEnough: Bool {
        if inputText.count >= 2 {
            return true
        } else {
            return false
        }
    }
    
    func saveText() {
        userNameData.append(inputText)
        inputText = ""
    }
}

#Preview {
    TextFieldBasic()
}
