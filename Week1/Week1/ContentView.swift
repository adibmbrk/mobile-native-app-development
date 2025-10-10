//
//  ContentView.swift
//  Week1
//
//  Created by Adib Samoon on 2025-10-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password = ""
    @State private var feedback: [String] = []
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Text("🔐 Password Strength Checker")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                
                SecureField("Enter password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: password) {
                        feedback = PasswordChecker.check(password)
                    }

                
                Button("Check Password") {
                    feedback = PasswordChecker.check(password)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                if !password.isEmpty {
                    if feedback.isEmpty {
                        Text("✅ Strong password!")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                    } else {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("❌ Weak password:")
                                .font(.headline)
                                .foregroundColor(.red)
                            ForEach(feedback, id: \.self) { issue in
                                Text("• \(issue)")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct PasswordChecker {
    static let digits = Set("0123456789")
    static let uppercase = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    static let lowercase = Set("abcdefghijklmnopqrstuvwxyz")
    static let special = Set("!@#$%^&*()-_=+[]{};:'\",.<>?/\\|`~")
    
    static func check(_ password: String) -> [String] {
        let passwordSet = Set(password)
        var issues: [String] = []
        
        if password.count < 10 {
            issues.append("Password must be at least 10 characters long.")
        }
        if passwordSet.isDisjoint(with: digits) {
            issues.append("Password must contain at least one digit.")
        }
        if passwordSet.isDisjoint(with: uppercase) {
            issues.append("Password must contain at least one uppercase letter.")
        }
        if passwordSet.isDisjoint(with: lowercase) {
            issues.append("Password must contain at least one lowercase letter.")
        }
        if passwordSet.isDisjoint(with: special) {
            issues.append("Password must contain at least one special character (!@#$%^&* etc.).")
        }
        
        return issues
    }
}

#Preview {
    ContentView()
}
