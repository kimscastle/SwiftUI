//
//  SliderBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct SliderBasic: View {
    @State var sliderValue: Double = 3
    @State var color = Color.blue
    var body: some View {
        VStack {
            HStack {
                Text("레벨 : ")
                Text("\(sliderValue)")
                Text(String(format: "%.0f", sliderValue))
            }//: Hstack
            .foregroundStyle(color)
            
            Slider(value: $sliderValue, in: 1...5, step: 1.0) {
                Text("라벨")
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("5")
            } onEditingChanged: { _ in
                color = .red
            }
            .tint(.red)
            .padding()

            
        }
    }
}

#Preview {
    SliderBasic()
}
