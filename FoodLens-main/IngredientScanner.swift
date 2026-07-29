//
//  IngredientScanner.swift
//

import SwiftUI
import Vision
struct IngredientScanner {
    
    static func scanIngredientsWithMatches(from image: UIImage, completion: @escaping (String, [IngredientCategory:[String]]) -> Void) {
        
        guard let cgImage = image.cgImage else {
            completion("", [:])
            return
        }
        
        let request = VNRecognizeTextRequest { request, _ in
            let recognizedText = request.results?
                .compactMap { $0 as? VNRecognizedTextObservation }
                .compactMap { $0.topCandidates(1).first?.string.lowercased() }
                .joined(separator: " ") ?? ""
            
            var results: [IngredientCategory:[String]] = [:]
            
            for category in IngredientCategory.allCases {
                let matches = category.keywords.filter { containsWholeWord($0, in: recognizedText) }
                if !matches.isEmpty { results[category] = matches }
            }
            
            completion(recognizedText, results)
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        let handler = VNImageRequestHandler(cgImage: cgImage)
        try? handler.perform([request])
    }
    
    private static func containsWholeWord(_ keyword: String, in text: String) -> Bool {
        let escaped = NSRegularExpression.escapedPattern(for: keyword)
        let pattern = "\\b\(escaped)\\b"
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
        let range = NSRange(text.startIndex..., in: text)
        return regex.firstMatch(in: text, options: [], range: range) != nil
    }
}



