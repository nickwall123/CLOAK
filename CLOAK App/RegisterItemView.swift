//
//  RegisterItemView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import SwiftUI

struct RegisterItemView: View {
    
    @EnvironmentObject var store: ItemStore
    @Environment(\.dismiss) var dismiss
    
    @State private var itemName = ""
    @State private var itemID = ""
    @State private var isRegistered = false
    @State private var selectedVerification: VerificationLevel = .unverified
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Register Item")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Item Name (e.g. Jacket)", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Picker("Verification", selection: $selectedVerification) {
                Text("Unverified").tag(VerificationLevel.unverified)
                Text("Photo").tag(VerificationLevel.photo)
                Text("Receipt").tag(VerificationLevel.receipt)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            if isRegistered {
                Text("✅ Registered!")
                    .foregroundColor(.green)
                
                Text("ID: \(itemID)")
                    .foregroundColor(.gray)
              
                Button(action: {
                    resetForm()
                    dismiss()
                }) {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue) // 👈 match Scan button color
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                
            } else {
                Button(action: {
                    registerItem()
                }) {
                    Text("Create Item")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
    
    func registerItem() {
        let newID = UUID().uuidString.prefix(8).description
        
        let success = store.addItem(
            id: newID,
            name: itemName,
            verification: selectedVerification
        )
        
        if success {
            // Reset state
            itemID = newID
            isRegistered = true
            
        }
    }
    
    func resetForm() {
        itemName = ""
        itemID = ""
        isRegistered = false
    }
}

#Preview {
        RegisterItemView()
            .environmentObject(ItemStore())
    }

