//
// IngredientCategory.swift
//

import Foundation
enum IngredientCategory: String, CaseIterable {
    // Basic Categories – accessible to all users
    case nut_free, dairy_free, gluten_free, veg, vegan, soy_free, shellfish_free, halal, kosher
    
    // Premium-only Categories
    case preservatives_free, palm_oil_free, added_sugars_free
    
    var keywords: [String] {
        switch self {
        case .nut_free: return IngredientKeywords.nut_free
        case .dairy_free: return IngredientKeywords.dairy_free
        case .gluten_free: return IngredientKeywords.gluten_free
        case .veg: return IngredientKeywords.veg
        case .vegan: return IngredientKeywords.vegan
        case .soy_free: return IngredientKeywords.soy_free
        case .shellfish_free: return IngredientKeywords.shellfish_free
        case .halal: return IngredientKeywords.halal
        case .kosher: return IngredientKeywords.kosher
        case .preservatives_free: return IngredientKeywords.preservatives_free
        case .palm_oil_free: return IngredientKeywords.palm_oil_free
        case .added_sugars_free: return IngredientKeywords.added_sugars_free
        }
    }
}



