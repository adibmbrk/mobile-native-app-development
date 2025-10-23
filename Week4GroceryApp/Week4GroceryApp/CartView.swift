//
//  CartView.swift
//  Week4GroceryApp
//
//  Created by Adib Samoon on 2025-10-23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var itemStore: ItemViewModel
    
    var purchasedItems: [Item] {
        itemStore.items.filter { $0.quantity > 0 }
    }
    
    var totalAmount: Double {
        purchasedItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Purchased Items Section
            VStack(alignment: .leading, spacing: 15) {
                Text("Purchased Items")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                if purchasedItems.isEmpty {
                    Text("No items in cart")
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                } else {
                    ForEach(purchasedItems) { item in
                        HStack {
                            Text(item.name)
                                .font(.title3)
                            Spacer()
                            Text("\(String(format: "%.1f", item.price * Double(item.quantity)))")
                                .font(.title3)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .padding(.horizontal)
                    }
                }
            }
            
            Spacer()
            
            // Payment Details Section
            VStack(alignment: .leading, spacing: 15) {
                Text("Payment Details")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                HStack {
                    Text("Net Amount")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(String(format: "%.1f", totalAmount))")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("My Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CartView()
            .environmentObject(ItemViewModel())
    }
}
