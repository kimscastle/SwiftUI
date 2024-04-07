//
//  ButtonStyleViewModifier.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/7/24.
//

import SwiftUI

struct ButtonStyleViewModifier: ButtonStyle {
    
    let scale: CGFloat
    let opacity: Double
    let brightness: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .opacity(configuration.isPressed ? opacity : 1)
            .brightness(configuration.isPressed ? brightness : 0)
    }
}

enum ButtonType {
    case press, opacity, tap
}

extension View {
    func asButton(scale: CGFloat = 0.95, opacity: Double = 1, brightness: Double = 0, action: @escaping ()->Void) -> some View {
        return Button {
            // Action
            action()
        } label: {
            self
        }
        .buttonStyle(ButtonStyleViewModifier(scale: scale, opacity: opacity, brightness: brightness))
    }
    
    @ViewBuilder
    func asButton(_ type: ButtonType = .tap, action: @escaping ()->Void) -> some View {
        switch type {
        case .press:
            self.asButton(scale: 0.95, action: action)
        case .opacity:
            self.asButton(scale: 1, opacity: 0.85, action: action)
        case .tap:
            self.onTapGesture {
                action()
            }
        }
    }
    
}
