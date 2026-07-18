//
//  AIService.swift
//  AI API TEST
//

import Foundation
import Combine
struct APIResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: Message
}

struct Message: Codable {
    let content: String
}


struct Recipe: Codable {
    let name: String
    let description: String
    let ingredients: [String]
    let steps: [String]
    let tips: [String]
}

class AIService {

    static func generateRecipe(
        ingredients: String,
        preferences: String,
        completion: @escaping (Result<Recipe, Error>) -> Void
    ) {

        guard let url = URL(string: "https://api.groq.com/openai/v1/chat/completions") else {
            return
        }

        let prompt = """
        Create a recipe using: \(ingredients).
        The recipe should be \(preferences). Don't include these preference descriptions in the title of recipe.

        Return ONLY valid JSON in this format:

        {
          "name": "Recipe name",
          "description": "Short recipe description",
          "ingredients": ["item 1", "item 2"],
          "steps": ["step 1", "step 2"],
          "tips": ["tip 1", "tip 2"]
        }
        """

        let body: [String: Any] = [
            "model": "llama-3.1-8b-instant",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(Config.groqAPIKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in

            // 1. Network error
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            // 2. No data
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "NoData", code: -1)))
                }
                return
            }

            do {
                // 3. Decode API response
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)

                guard let content = apiResponse.choices.first?.message.content,
                      let jsonData = content.data(using: .utf8) else {
                    throw NSError(domain: "InvalidContent", code: -2)
                }

                // 4. Decode Recipe JSON
                let recipe = try JSONDecoder().decode(Recipe.self, from: jsonData)

                // 5. Return on main thread
                DispatchQueue.main.async {
                    completion(.success(recipe))
                }

            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

        }.resume()
    }
    
    static func generateHomeInsight(
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        guard let url = URL(string: "https://api.groq.com/openai/v1/chat/completions") else { return }

        let prompt = """
        Give a single, short (1–2 sentence) personalized food insight or tip for someone \
        who scanned 3 products this week, mostly chose gluten-free items, and saved 2 recipes. \
        Be conversational and encouraging. Return plain text only, no JSON, no quotes.
        """

        let body: [String: Any] = [
            "model": "llama-3.1-8b-instant",
            "messages": [["role": "user", "content": prompt]]
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(Config.groqAPIKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do { request.httpBody = try JSONSerialization.data(withJSONObject: body) }
        catch { completion(.failure(error)); return }

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error { DispatchQueue.main.async { completion(.failure(error)) }; return }
            guard let data = data else { return }
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                let text = apiResponse.choices.first?.message.content ?? "Keep making great choices!"
                DispatchQueue.main.async { completion(.success(text)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }.resume()
    }
}


