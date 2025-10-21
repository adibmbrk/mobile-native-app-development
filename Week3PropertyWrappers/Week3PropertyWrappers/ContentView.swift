//
//  ContentView.swift
//  Week3PropertyWrappers
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Text("\(viewModel.counter)")
            .font(.largeTitle)
        CounterControlsView()
        
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
