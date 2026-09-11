//
//  ItemStore.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var items: [Item] = []
    
    func getItem(by id: String) -> Item? {
        return items.first(where: { $0.id == id })
        
    }
    
    func addItem(id: String, name: String, verification: VerificationLevel) -> Bool {
        
        if items.contains(where: { $0.id == id }) {
            return false
        }
        
        let newItem = Item(
            id: id,
            name: name,
            dateClaimed: Date(),
            verification: verification
        )
        
        items.append(newItem)
        return true
    }
}
