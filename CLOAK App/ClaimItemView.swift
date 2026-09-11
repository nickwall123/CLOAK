//
//  ClaimItemView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import SwiftUI

struct ClaimItemView: View {
    
    let itemID: String
    @State private var isClaimed = false
    @State private var alreadyOwned = false
    @EnvironmentObject var store: ItemStore
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Claim Item")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Item ID: \(itemID)")
                .foregroundColor(.gray)
            
            if isClaimed {
                Text("✅ Item Claimed!")
                    .font(.title2)
                    .foregroundColor(.green)

            } else if alreadyOwned {
                Text("⚠️ Item already owned")
                    .font(.title2)
                    .foregroundColor(.orange)

            } else {
                Button(action: {
                    claimItem()
                }) {
                    Text("Confirm Ownership")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
    
    func claimItem() {
        let success = store.addItem(
            id: itemID,
            name: "Scanned Item",
            verification: .nfc
        )
        
        if success {
            isClaimed = true
        } else {
            alreadyOwned = true
        }
    }
}

#Preview {
    ClaimItemView(itemID: "12345678")
        .environmentObject(ItemStore())
}
