//
//  colors.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI
import Foundation

struct ColorsRecentItem:Identifiable {
    var id: UUID = UUID()
    var background: String
    var text: String
    
    init( background: String, text: String) {
        self.background = background
        self.text = text
    }
}
