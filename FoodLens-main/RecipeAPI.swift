//
//  RecipeAPI.swift
//  FoodLens
//


import Foundation

struct RecipeIngredientAPI: Codable, Identifiable {
    let id = UUID()
    let name: String
    let quantity: String?
   
    enum CodingKeys: String, CodingKey {
        case name
        case quantity
    }
}


struct RecipeAPI: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let ingredients: [RecipeIngredientAPI]
    let instructions: String
    let cookTime: Int?
    let difficulty: String?
    let imageURL: String?
   
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case ingredients
        case instructions
        case cookTime = "cook_time"
        case difficulty
        case imageURL = "image_url"
    }
}
