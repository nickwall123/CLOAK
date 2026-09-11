//
//  VerificationLevel.swift
//  CLOAK App
//
//  Created by Nick Wallace on 9/11/26.
//

import Foundation

enum VerificationLevel: String, Codable {
    case unverified = "Unverified"
    case photo = "Photo Verified"
    case receipt = "Receipt Verified"
    case nfc = "NFC Verified"
}
