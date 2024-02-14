//
//  Colors.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Colors: View {
    // `#colorLiteral(` 을 입력하면된다
    let customColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    var body: some View {
        Circle()
            .fill(Color("modeColor"))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    Colors()
}
