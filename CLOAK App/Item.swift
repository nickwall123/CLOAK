//
//  Item.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import Foundation

struct Item: Identifiable {
    let id: String
    let name: String
    let dateClaimed: Date
    let verification: VerificationLevel
}
