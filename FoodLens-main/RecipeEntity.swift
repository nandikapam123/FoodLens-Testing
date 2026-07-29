//
//  RecipeEntity.swift
//  FoodLens
//

import Foundation
import SwiftData

@Model
class RecipeEntity {
    var id: UUID
    var name: String
    var recipeDescription: String
    var ingredients: [String]
    var steps: [String]
    var tips: [String]
    var createdAt: Date

    init(name: String,
         recipeDescription: String,
         ingredients: [String],
         steps: [String],
         tips: [String]) {
        
        self.id = UUID()
        self.name = name
        self.recipeDescription = recipeDescription
        self.ingredients = ingredients
        self.steps = steps
        self.tips = tips
        self.createdAt = Date()
    }
}

extension RecipeEntity {
    convenience init(from recipe: RecipeShow) {
        self.init(
            name: recipe.name,
            recipeDescription: recipe.description,
            ingredients: recipe.ingredients!,
            steps: recipe.steps!,
            tips: recipe.tips!,
        )
    }
}

