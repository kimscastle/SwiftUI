//
//  TabViewBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct TabViewBasic: View {
    @State var initPageNumber = 0
    
    var body: some View {
        TabView(selection: $initPageNumber,
                content:  {
            Text("홈화면")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("둘러보기 화면")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            Text("프로필 화면")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        })
    }
}

#Preview {
    TabViewBasic()
}
