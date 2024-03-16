//
//  IgnoreSafeAreaBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/16/24.
//

import SwiftUI

struct IgnoreSafeAreaBasic: View {
    @State var mainTitle = "아직버튼 안눌림"
    var body: some View {
        a()
    }
    
    @ViewBuilder
    func a() -> some View {
//        VStack {
            Text("1")
            Text("2")
//        }
    }
}

#Preview {
    IgnoreSafeAreaBasic()
}
