//
//  ContentView.swift
//  ParcelApp
//
//  Created by Adib Samoon on 2025-10-10.
//

import SwiftUI

struct ParcelAppView: View {
    @State private var weight = ""
    @State private var length = ""
    @State private var width = ""
    @State private var height = ""
    @State private var resultMessage = ""
    @State private var cost = ""
    
    var isDisabled: Bool {
        return weight.isEmpty || length.isEmpty || width.isEmpty || height.isEmpty
    }
    
    private func calculateCost() {
        
        print("Weight: \(weight), Length: \(length), Width: \(width), Height: \(height)")
        
        if let doubleWeight = Double(weight),
           let doubleLength = Double(length),
           let doubleWidth = Double(width),
           let doubleHeight = Double(height),
           doubleWeight > 0, doubleLength > 0, doubleWidth > 0, doubleHeight > 0 {
            
            let volume = doubleLength * doubleWidth * doubleHeight
            var totalCost = 3.00
            
            totalCost += doubleWeight * 0.50
            totalCost += (volume / 1000) * 0.10
            
            totalCost = max(totalCost, 4.00)
            
            cost = String(format: "%.2f", totalCost)
            resultMessage = "Total Shipping Cost: $\(cost)"
            print(resultMessage)
        } else {
            resultMessage = "Invalid input. Please enter valid numbers."
        }
        
    }

    var body: some View {
        VStack(spacing: 20) {
            
            Text("📦 Parcel Cost Calculator")
                .font(.title)
                .bold()
                .padding(.top)

            HStack {
                Text("Weight (kg):")
                TextField("Enter weight", text: $weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            HStack {
                Text("Length (cm):")
                TextField("Enter length", text: $length)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            

            HStack {
                Text("Width (cm):")
                TextField("Enter width", text: $width)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
 
            HStack {
                Text("Height (cm):")
                TextField("Enter height", text: $height)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            if !cost.isEmpty {
                if let costValue = Double(cost), costValue > 0 {
                    Text("Total Shipping Cost: $\(cost)")
                } else {
                    Text(cost)
                        .foregroundColor(.red)
                }
                    
            }
            

            Button("Calculate Cost") {
                calculateCost()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isDisabled ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .disabled(isDisabled)
            
      
            if !resultMessage.isEmpty {
                Text(resultMessage)
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ParcelAppView()
}
