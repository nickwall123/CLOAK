//
//  CLOAK_AppApp.swift
//  CLOAK App
//
//  Created by Nick Wallace on 6/18/26.
//

import SwiftUI

@main
struct CLOAK_AppApp: App {
    
    @StateObject var store = ItemStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
