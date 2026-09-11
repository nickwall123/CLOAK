//
//  MyItemsView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import SwiftUI

struct MyItemsView: View {
    @EnvironmentObject var store: ItemStore
    var body: some View {
        VStack {
            
            Text("My Items")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if store.items.isEmpty {
                Text("No items yet")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(store.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text("ID: \(item.id)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("Claimed: \(item.dateClaimed.formatted())")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

#Preview {
    MyItemsView()
        .environmentObject(ItemStore())
}
