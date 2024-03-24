//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by uiskim on 3/24/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
