//
//  ButtonsBootcamp.swift
//  SwiftUIBootcamp(BeginnerLevel)
//
//  Created by uiskim on 2/3/24.
//

import SwiftUI

struct ButtonsBootcamp: View {
    
    @State var title = "This is my title"
    
    var body: some View {
        VStack {
            Text(title)
    
            Button("Press me!") {
                self.title = "BUTTON WAS PRESSED"
            }
            
            Button(action: {
                self.title = "BUTTON 2 WAS PRESSED"
            }, label: {
                Circle()
                    .frame(width: 50)
                    .overlay {
                        Text("12")
                            .foregroundStyle(.white)
                    }
            })
            Button(action: {
                self.title = "BUTTON 3 WAS PRESSED"
            }, label: {
                Text("Button")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    )
                
            })
            
            Button(action: {
                self.title = "BUTTON 4 WAS PRESSED"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                    }
            })
            
            Button(action: {
                self.title = "BUTTON 5 WAS PRESSED"
            }, label: {
                Text("Button")
                    .font(.callout)
                    .bold()
                    .foregroundStyle(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2)
                    )
            })
        }

    }
}

#Preview {
    ButtonsBootcamp()
}
