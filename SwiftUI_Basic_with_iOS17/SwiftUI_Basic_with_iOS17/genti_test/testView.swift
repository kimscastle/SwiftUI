//
//  testView.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 4/1/24.
//

import SwiftUI

let deviceWidth = UIScreen.main.bounds.width
let deviceHeighe = UIScreen.main.bounds.height

struct testView: View {
    @State var isOn: Bool = false
    @State var currentTab: Int = 0
    var body: some View {
        ZStack {
            Image("testBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image("hbutton")
                        .resizable()
                        .frame(width: 26, height: 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.top, 54)
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, content: {
                        Text("안녕하세요,")
                        HStack(spacing: 5) {
                            Text("김젠티")
                                .font(.title2)
                                .bold()
                            Text("크리에이터님")
                                .font(.title2)
                        }
                    })
                    Spacer()
                    
                    Image("gear")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .padding(.horizontal, 27)
                .padding(.top, 22)
                
                RoundedRectangle(cornerRadius: 18)
                    .fill(.clear)
                    .background(
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: 3, opaque: true)
                            .background(.white.opacity(0.4))
                            .clipShape(.rect(cornerRadius: 18))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .inset(by: 0.5)
                            .stroke(isOn ? Color.green : Color(red: 0.81, green: 0.81, blue: 0.81).opacity(0.16), lineWidth: 1)
                            .overlay(alignment: .center, content: {
                                VStack {
                                    Image(isOn ? "bb" : "aa")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                    
                                    Text(isOn ? "새로운 작업을 기다리고 있어요" : "새로운 작업을 받을 수 없는 상태에요")
                                }
                            })
                            .padding(10)
                    )
                
                
                    .shadow(color: .black.opacity(0.09), radius: 13)
                    .frame(height: 133)
                    .padding(.horizontal, 16)
                    .padding(.top, 27)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(                    
                        LinearGradient(
                        stops: [
                        Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.9, green: 0.9, blue: 0.9), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 1.08, y: 1),
                        endPoint: UnitPoint(x: 0, y: 1)
                        ))
                    .frame(height: 50)
                    .overlay {
                        HStack {
                            Text("새로운 작업 받기")
                            Toggle(isOn: $isOn, label: {})
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(.horizontal, 28)
                    .padding(.top, 39)
                
                VStack(spacing: 0){
                    Rectangle()
                        .fill(.white)
                        .frame(height: 48)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 48,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 48
                            )
                        )
                        .shadow(color: .black.opacity(0.09), radius: 5)
                        .overlay(alignment: .center) {
                            Text("내 작업실")
                        }
                    
                    Rectangle()
                        .fill(.gray.opacity(0.1))
                        .frame(height: 1)
                        
                    TabBarView(currentTab: $currentTab)
                    
                    TabView(selection: self.$currentTab) {
                        TaskView(number: 0).tag(0)
                        TaskView(number: 1).tag(1)
                        TaskView(number: 2).tag(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    

                }
                .padding(.top, 39)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
//    @Namespace var namespace
    var tabBarOptions: [String] = ["작업실1", "작업실2", "작업실2"]
    var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                TabBarItem(title: name, currentTab: $currentTab, tab: index)
                    .padding(.horizontal, 20)
            }
        } //:HSTACK
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.white)
    }
}

struct TabBarItem: View {
    var title: String
    @Binding var currentTab: Int
    @Namespace var namespace

    var tab: Int
    var body: some View {
        
        Button {
            self.currentTab = tab
        } label: {
            VStack(alignment:.center, spacing: 4) {
                Text(title)
                    .foregroundStyle(currentTab == tab ? .black : .gray.opacity(0.5))
                if currentTab == tab {
                    Color.black
                        .frame(width: 30, height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(width: 30, height: 2)
                }
            }
            .animation(.spring(), value: currentTab)
        }
    }
}

#Preview {
    testView()
}
