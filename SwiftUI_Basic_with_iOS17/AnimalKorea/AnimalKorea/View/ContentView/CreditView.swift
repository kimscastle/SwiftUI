//
//  CreditView.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Text("""
  Copyright © Jacob Ko
  All right reserved
  Created by SwiftUI with MVVM architecture
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
            .padding()
            .opacity(0.5)
        }
    }
}

#Preview {
    CreditView()
}
