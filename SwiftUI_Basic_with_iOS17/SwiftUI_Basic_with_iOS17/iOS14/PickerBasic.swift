//
//  PickerBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct PickerBasic: View {
    let typeOfPhone = ["애플", "삼성", "샤오미", "기타브랜드"]
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedIndex) {
                        ForEach(0..<typeOfPhone.count, id: \.self) { index in
                            Text(typeOfPhone[index])
                        }
                    } label: {
                        Text("기종선택")
                    }//: Picker
                    .pickerStyle(.wheel)
                }//: Section
                
                Text("제조사는 \(typeOfPhone[selectedIndex])입니다")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .navigationTitle("현재사용중인 기종은?")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }//: Body
}

#Preview {
    PickerBasic()
}
