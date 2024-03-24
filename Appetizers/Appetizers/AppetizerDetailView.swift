//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    let appetizser: Appetizer
    @Binding var isShowDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizser.imageURL)
                .scaledToFill()
                .frame(height: 225)
            
            VStack {
                Text(appetizser.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizser.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizser.calories)
                    NutritionInfo(title: "Carbs", value: appetizser.carbs)
                    NutritionInfo(title: "Pretein", value: appetizser.protein)
                }
            }
            
            Spacer()
            
            Button {
                // Action
                order.add(appetizser)
                self.isShowDetail = false
            } label: {
                APButton(title: "$\(appetizser.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                // Action
                self.isShowDetail = false
            } label: {
                XDismissButton()
            }
        }
    }

}

#Preview {
    AppetizerDetailView(appetizser: MockData.sampleAppetizer, isShowDetail: .constant(true))
}


