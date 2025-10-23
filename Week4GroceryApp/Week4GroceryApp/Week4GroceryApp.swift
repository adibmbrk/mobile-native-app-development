//
//  Week4GroceryApp.swift
//  Week4MockTest
//
//  Created by Adib Samoon on 2025-10-23.
//

import SwiftUI

@main
struct Week4GroceryApp: App {
    
    @StateObject private var itemStore = ItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            GroceryListView()
                .environmentObject(itemStore)
        }
    }
}
