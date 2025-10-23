//
//  ItemViewModel.swift
//  Week4MockTest
//
//  Created by Adib Samoon on 2025-10-23.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject {
    
    @Published private(set) var items: [Item] = [
        Item(name: "Broccoli", price: 10.00, imageName: "broccoli"),
        Item(name: "Banana", price: 10.00, imageName: "banana"),
        Item(name: "Avocado", price: 8.00, imageName: "avocado"),
        Item(name: "Chicken", price: 10.00, imageName: "chicken"),
        Item(name: "Water", price: 10.00, imageName: "water")
    ]
    
    func addQuantity(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }), items[index].quantity < 10 {
            items[index].quantity += 1
        }
    }
    
    func removeQuantity(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }), items[index].quantity > 0 {
            items[index].quantity -= 1
        }
    }
}
