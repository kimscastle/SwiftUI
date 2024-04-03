//
//  TransparentBlurView.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 4/1/24.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let backgropLayer = uiView.layer.sublayers?.first {
                if removeAllFilters {
                    backgropLayer.filters = []
                } else {
                    backgropLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"
                    })
                }
            }
        }
    }
}

#Preview("blur") {
    TransparentBlurView()
        .padding(15)
}
