//
//  ListBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct ListBasic: View {
    @State var fruits = ["사과", "오렌지", "바나나", "수박"]
    @State var meats = ["소고기", "돼지고기", "닭고기"]
    
    @State var showFirstSection = true
    @State var showSectionSection = true
    
    var body: some View {
        NavigationStack {
            List {
                // iOS17부터는 list를 sidebar타입으로 하면 isExpanded로 binding시켜줘야한다
                Section(isExpanded: $showFirstSection) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: { indexSet in
                        fruits.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        fruits.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .listRowBackground(Color.blue)


                } header: {
                    Text("과일종류")
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                
                Section(isExpanded: $showSectionSection) {
                    ForEach(meats, id: \.self) { meat in
                        Text(meat)
                    }
                } header: {
                    Text("고기종류")
                        .font(.headline)
                        .foregroundStyle(.red)
                }

                
            }
            .navigationTitle("안녕하세요")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.sidebar)
            // iOS17부터는 .navigationBarItem이아니라 toolbar에 ToolbarItem을 넣어줘야한다
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        fruits.append("딸기")
                    }, label: {
                        Text("Add")
                    })
                }
            })
        }
    }
}

#Preview {
    ListBasic()
}
