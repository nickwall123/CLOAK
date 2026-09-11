//
//  ItemDetailView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import SwiftUI

struct ItemDetailView: View {
    
    func loadItem() {
        item = store.getItem(by: itemID)
    }
    
    @EnvironmentObject var store: ItemStore
    
    let itemID: String
    @State private var item: Item? = nil
    @State private var itemName = ""
    @State private var isClaimed = false
    @State private var alreadyOwned = false
    @State private var verificationLevel: VerificationLevel = .unverified
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Item")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("ID: \(itemID)")
                .foregroundColor(.gray)
            
            if let existingItem = item {
                
                Button("Done") {
                    dismiss()
                }
                .padding()
                
                Text(existingItem.name)
                    .font(.title2)
                
                Text("Owned")
                    .foregroundColor(.green)
            }
            
            else {
                
                Text("New Item")
                    .font(.headline)
                
                TextField("Enter Item Name", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Picker("Verification", selection: $verificationLevel) {
                    Text("Unverified").tag(VerificationLevel.unverified)
                    Text("Photo").tag(VerificationLevel.photo)
                    Text("Receipt").tag(VerificationLevel.receipt)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Button("Register & Claim") {
                    registerItem()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .onAppear {
            loadItem()

        }
    }
    
    func registerItem() {
        let success = store.addItem(
            id: itemID,
            name: itemName,
            verification: verificationLevel
        )
        
        if success {
            isClaimed = true
            loadItem()
        } else {
            alreadyOwned = true
        }
    }
}

#Preview {
    ItemDetailView(itemID: "12345678")
        .environmentObject(ItemStore())
}
