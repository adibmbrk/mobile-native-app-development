//
//  ItemModel.swift
//  Week4MockTest
//
//  Created by Adib Samoon on 2025-10-23.
//

import Foundation

struct Item : Identifiable {
    
    var id = UUID()
    var name: String
    var price: Double
    var quantity = 0
    var imageName: String
}
