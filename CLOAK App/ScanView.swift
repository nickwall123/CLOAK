//
//  ScanView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import SwiftUI

struct ScanView: View {
    
    @EnvironmentObject var store: ItemStore
    
    @State private var scannedID: String?
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 30) {

                Text("Scan Item")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if let id = scannedID {
                    
                    Text("Item Detected")
                        .font(.headline)

                    Text("ID: \(id)")
                        .foregroundColor(.gray)

                } else {
                    
                    Button(action: {
                        simulateScan()
                    }) {
                        Text("Tap to Scan")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
            }

            // ✅ Navigation is OUTSIDE the VStack
            NavigationLink(
                destination: ItemDetailView(itemID: scannedID ?? ""),
                isActive: $shouldNavigate
            ) {
                EmptyView()
            }
        }
    }
    
    func simulateScan() {
        scannedID = UUID().uuidString.prefix(8).description
        shouldNavigate = true
    }
}

#Preview {
    ScanView()
        .environmentObject(ItemStore())
}
