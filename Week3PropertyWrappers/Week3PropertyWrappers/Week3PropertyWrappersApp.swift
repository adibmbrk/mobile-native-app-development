//
//  Week3PropertyWrappersApp.swift
//  Week3PropertyWrappers
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

@main
struct Week3PropertyWrappersApp: App {
    
 private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
