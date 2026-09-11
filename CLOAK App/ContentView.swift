//
//  ContentView.swift
//  CLOAK App
//
//  Created by Nick Wallace on 6/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                Spacer()
                
                // Logo / Title
                Image(systemName: "lock.shield")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("CLOAK")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Ownership for physical items")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                // Buttons
                VStack(spacing: 15) {
                    
                    Button(action: {
                        print("Scan tapped")
                    }) {
                        Text("Scan Item")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        print("My Items tapped")
                    }) {
                        Text("My Items")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
