//
//  ListLayout.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct ListLayout: View {
    @State var showSectionArrow = true
    @State var cars = [
        "Hyundai",
        "Kia",
        "Tesla",
        "BMW",
        "Mercesdes"
    ]
    
    var body: some View {
        List {
            Section("CAR BRANDS", isExpanded: $showSectionArrow) {
                ForEach(cars, id: \.self) { car in
                    Text("\(car)")
                }
                .onDelete { indexSet in
                    cars.remove(atOffsets: indexSet)
                }
            }
            Section("DETAIL MODEL") {
                Text("GV 80")
                Text("K5")
                Text("BMW 520")
                Text("E Class")
            }
        }
        .listStyle(.sidebar)

    }
}

#Preview {
    ListLayout()
}
