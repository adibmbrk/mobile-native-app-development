//
//  ViewModel.swift
//  Week3PropertyWrappers
//
//  Created by Adib Samoon on 2025-10-17.
//

import Combine

class ViewModel: ObservableObject {
    @Published private(set) var counter: Int = 0
    
    func increment() {
        counter += 1
    }
    
    func decrement() {
        counter -= 1
    }
    
    func reset() {
        counter = 0
    }
}
