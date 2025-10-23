//
//  GroceryListView.swift
//  Week4MockTest
//
//  Created by Adib Samoon on 2025-10-23.
//

import SwiftUI

struct GroceryListView: View {
    
    @EnvironmentObject var itemStore : ItemViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Buy Fresh Groceries")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                List(itemStore.items) { item in
                    HStack(spacing: 15) {
                        // Item image
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        // Item name and price
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("$\(String(format: "%.1f", item.price))")
                                .font(.title3)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                        
                        // Quantity stepper and number
                        HStack(spacing: 10) {
                            Stepper("", onIncrement: {
                                itemStore.addQuantity(item: item)
                            }, onDecrement: {
                                itemStore.removeQuantity(item: item)
                            })
                            .labelsHidden()
                            
                            Text("\(item.quantity)")
                                .font(.title2)
                                .frame(minWidth: 30)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                
                // Checkout Button
                NavigationLink(destination: CartView()) {
                    Text("Checkout")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    GroceryListView()
        .environmentObject(ItemViewModel())
}
