//
//  TabbarView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/20/24.
//

import SwiftUI

struct TabbarView: View {
    
    @StateObject var viewModel = AnimalViewModel()
    
    var body: some View {
        TabView {
            ContentView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }

            VideoView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("비디오")
                }
            GalleryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "photo")
                    Text("갤러리")
                }
            AppInfoView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("갤러리")
                }
        }
    }
}

#Preview {
    TabbarView()
}
