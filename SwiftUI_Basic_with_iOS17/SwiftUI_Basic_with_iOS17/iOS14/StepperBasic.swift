//
//  StepperBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct StepperBasic: View {
    @State var stepperValue = 0
    @State var widthChanged: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("기본stepper: \(stepperValue)", value: $stepperValue)
                .padding()
            
            Divider()
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthChanged, height: 100)
                .animation(.easeInOut, value: widthChanged)
            
            Stepper("직사각형 너비 변화") {
                widthChanged += 20
            } onDecrement: {
                widthChanged -= 20
            }

        }//: Vstack
    }
}

#Preview {
    StepperBasic()
}
