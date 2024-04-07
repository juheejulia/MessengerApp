//
//  ColorExtention.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-07.
//

import SwiftUI

extension Color {
    
    static let mintColor : Color = Color(hex: 0x00A490)
    static let peachColor : Color = Color(hex: 0xCFAEAE)
    
    init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0)
   }

    init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
   }
    
}
