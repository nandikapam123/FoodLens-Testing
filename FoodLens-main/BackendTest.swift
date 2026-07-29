//
//  BackendTest.swift
//  FoodLens
//

import Foundation
import Combine

@MainActor
final class BackendTest: ObservableObject {
   
    @Published var message = "Testing backend..."
   
    func testConnection() {
        Task {
            do {
                let recipes = try await BackendService.shared.getRecipes()
               
                message = "Success! Received \(recipes.count) recipes."
               
                print("BACKEND TEST SUCCESS")
                print("Received \(recipes.count) recipes")
               
                for recipe in recipes {
                    print("- \(recipe.title)")
                }
               
            } catch {
                message = "Backend error: \(error.localizedDescription)"
               
                print("BACKEND TEST FAILED")
                print(error)
            }
        }
    }
}

