//
//  ContentView.swift
//  Week2
//
//  Created by Adib Samoon on 2025-10-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitPrice: String = ""
    @State private var quantity: String = ""
    @State private var total: String = ""
    @State private var errorMsg: String = ""
    
    var isDisabled: Bool {
        
        return unitPrice.isEmpty || quantity.isEmpty
        
    }
    
   
    
    var body: some View {
        VStack {
            
            Text("Calculator")
                .font(.largeTitle)
                .bold()
            
            
            
            HStack {
                Text("Enter Unit Price: ")
                TextField("Unit Price", text: $unitPrice)
                    .keyboardType(.numberPad)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
            
            }
            
            HStack {
                Text("Enter Quantity: ")
                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                
            }
            
            Button("Calculate") {
                if let doubleUnitPrice = Double(unitPrice),
                       let doubleQuantity = Double(quantity) {
                        let result = doubleUnitPrice * doubleQuantity
                        total = "Total is \(result)"
                        errorMsg = ""
                    } else {
                        errorMsg = "Invalid user input"
                        total = ""
                    }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(isDisabled)
            
            
            
            if !total.isEmpty {
                Text(total).foregroundStyle(.green)
                
            }
            
            if !errorMsg.isEmpty {
                Text(errorMsg).foregroundStyle(.red)
                
            }
            
            
            
            
          
        }.padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}
