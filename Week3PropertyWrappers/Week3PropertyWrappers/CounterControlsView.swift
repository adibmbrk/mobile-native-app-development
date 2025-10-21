//
//  CounterControlsView.swift
//  Week3PropertyWrappers
//
//  Created by Adib Samoon on 2025-10-17.
//

import SwiftUI

struct CounterControlsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {

            VStack {
                HStack{
                    Button("Increment") {
                        viewModel.increment()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                    Button("Decrement") {
                        viewModel.decrement()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                Button("Reset") {
                    viewModel.reset()
                }
            }
        }
    }
}

#Preview {
    CounterControlsView()
}
