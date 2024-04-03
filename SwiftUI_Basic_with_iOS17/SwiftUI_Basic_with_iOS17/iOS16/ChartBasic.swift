////
////  ChartBasic.swift
////  SwiftUI_Basic_with_iOS17
////
////  Created by uiskim on 3/23/24.
////
//
//import SwiftUI
//import Charts
//
//struct WeightModel: Identifiable {
//    var id = UUID().uuidString
//    var day: String
//    var weight: Double
//}
//
//var weightData: [WeightModel] = [
//    WeightModel(day: "Sun", weight: 77),
//    WeightModel(day: "Mon", weight: 80),
//    WeightModel(day: "Tue", weight: 90),
//    WeightModel(day: "Wed", weight: 82),
//    WeightModel(day: "Thu", weight: 70),
//    WeightModel(day: "Fri", weight: 60),
//    WeightModel(day: "Sat", weight: 88)
//]
//
//struct ChartBasic: View {
//    var body: some View                   
//        ScrollView {
//            VStack(spacing: 20) {
//                Text("1. 바형차트")
//                Chart(weightData) { item in
//                    BarMark(x: .value("Day", item.day),
//                            y: .value("Weight", item.weight))
//                }
//                .frame(height: 200)
//                
//                Text("2. 라인차트")
//                Chart(weightData) { item in
//                    LineMark(x: .value("Day", item.day), y: .value("Weight", item.weight))
//                }
//                .frame(height: 200)
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ChartBasic()
//}
