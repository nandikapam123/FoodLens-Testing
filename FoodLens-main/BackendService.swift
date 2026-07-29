//
//  BackendService.swift
//  FoodLens

import Foundation

final class BackendService {
   
    static let shared = BackendService()
   
    private let baseURL = "http://192.168.1.107:8000"
   
    private init() {}
   
    func getRecipes() async throws -> [RecipeAPI] {
        guard let url = URL(string: "\(baseURL)/recipes") else {
            throw URLError(.badURL)
        }
       
        let (data, response) = try await URLSession.shared.data(from: url)
       
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
       
        guard httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
       
        return try JSONDecoder().decode([RecipeAPI].self, from: data)
    }
}
