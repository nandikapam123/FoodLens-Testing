//
//  Theme.swift
//  

import SwiftUI
struct Theme {
    // Base Colors
    static let primaryGreen = Color(red: 0.55, green: 1.00, blue: 0.55) // slightly brighter
    static let lightGreen = Color(red: 0.80, green: 0.95, blue: 0.85)
    static let backColor = Color(red: 0.08, green: 0.15, blue: 0.13) // darker for contrast
    static let accentColor = Color(red: 0.35, green: 0.95, blue: 0.80) // neon pop
    
    // Gradient for buttons or highlights
    static let greenGradient = LinearGradient(
        gradient: Gradient(colors: [primaryGreen, accentColor]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Soft glow for shadows or glowing buttons
    static let glowGreen = Color(red: 0.40, green: 1.00, blue: 0.70).opacity(0.7)
    
    // Text colors
    static let primaryText = Color.white
    static let secondaryText = Color.gray.opacity(0.7)
}


