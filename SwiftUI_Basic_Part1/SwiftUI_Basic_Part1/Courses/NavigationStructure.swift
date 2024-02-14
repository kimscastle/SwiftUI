//
//  NavigationStructure.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct NavigationStructure: View {
    var profiles: [Profile] = [
        .init(imageName: "street", title: "Social", iconImageName: "person.2.fill"),
        .init(imageName: "flowers", title: "Dogs", iconImageName: "dog.fill"),
        .init(imageName: "pretty", title: "Puppy", iconImageName: "pawprint.fill")
    ]
    var body: some View {
        // 기존방식
        // 다음뷰의데이터를 이전뷰에서 다 알고있어야한다
        NavigationStack {
            List {
                Section("Category") {
                    ForEach(profiles, id: \.self) { profile in
                        NavigationLink(value: profile) {
                            HStack {
                                Image(systemName: profile.iconImageName)
                                Text("\(profile.title)")
                            }
                        }
                        .navigationDestination(for: Profile.self) { profile in
                            Image(profile.imageName)
                                .resizable()
                                .ignoresSafeArea()
                        }
                    }
                }
            }
        }
    }
}

struct Profile: Hashable {
    var imageName: String
    var title: String
    var iconImageName: String
}

#Preview {
    NavigationStructure()
}
