//
//  Week3BookListAppApp.swift
//  Week3BookListApp
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

@main
struct Week3BookListAppApp: App {
    
    @StateObject var viewModel = BookListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
