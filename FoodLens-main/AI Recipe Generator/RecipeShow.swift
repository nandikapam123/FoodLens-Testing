//
//  Recipe.swift
//  FoodLens
//


import SwiftUI
import SwiftData

struct RecipeShow: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let ingredients: [String]?
    let steps: [String]?
    let tips: [String]?
}

extension RecipeShow {
    init(from entity: RecipeEntity) {
        self.name = entity.name
        self.description = entity.recipeDescription
        self.ingredients = entity.ingredients
        self.steps = entity.steps
        self.tips = entity.tips
    }
}


