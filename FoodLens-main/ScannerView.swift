//
//  ScannerView.swift
//

import SwiftUI
import AVFoundation
struct ScannerView: View {
    
    @Environment(\.userSession) var user
    
    @State private var showTip = true
    
    @State private var showPicker = false
    @State private var capturedImage: UIImage?
    
    @State private var scannedText: String = ""
    @State private var detectedMatches: [String] = []
    @State private var ingredientWords: [String] = []
    
    private let speechSynthesizer = AVSpeechSynthesizer()
    @State private var selectedCategory: IngredientCategory = .veg
    @State private var isScanButtonPressed = false
    
    var body: some View {
        ZStack {
            Theme.backColor.ignoresSafeArea()
            ScrollView{
                
                VStack(spacing: 28) {
                    titleView
                        .padding(.bottom, -20)
                        .padding(.top, 10)
                    scanControlsBox
                    if capturedImage != nil { resultsBox }
                    if showTip {tipBox}
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showPicker) {
            CameraOrPhotoPicker { (image: UIImage) in
                capturedImage = image
                scanImage(image)
            }
        }
    }
        
    private var titleView: some View {
        PageHeader(
            title: "Food Scanner",
            subtitle: "Take a photo of any ingredient label and instantly find out if it fits your dietary needs, from gluten-free to halal."
        )
    }
    
    private var scanControlsBox: some View {
        DarkCard{
            Text("Select Category to Scan For")
                .font(.headline)
                .foregroundColor(Theme.primaryGreen)
                .padding(.top, 10)
            categoryPicker
            scanButton
        }
        .padding()
    }
    
    private var categoryPicker: some View {
        Picker("Select Category", selection: $selectedCategory) {
            Text("Nut-Free").tag(IngredientCategory.nut_free)
            Text("Dairy-Free").tag(IngredientCategory.dairy_free)
            Text("Gluten-Free").tag(IngredientCategory.gluten_free)
            Text("Vegetarian").tag(IngredientCategory.veg)
            Text("Vegan").tag(IngredientCategory.vegan)
            Text("Soy-Free").tag(IngredientCategory.soy_free)
            Text("Shellfish-Free").tag(IngredientCategory.shellfish_free)
            Text("Halal").tag(IngredientCategory.halal)
            Text("Kosher").tag(IngredientCategory.kosher)
            if user.accountType == "Premium" {
                Text("Preservatives").tag(IngredientCategory.preservatives_free)
                Text("Palm Oil").tag(IngredientCategory.palm_oil_free)
                Text("Added Sugars").tag(IngredientCategory.added_sugars_free)
            }
        }
        .onChange(of: selectedCategory) { (_ newCategory: IngredientCategory) in
            clearScreen()
        }
        .pickerStyle(.wheel)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Theme.lightGreen.opacity(1))
                .shadow(color: Theme.glowGreen.opacity(0.3), radius: 5, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
    
    private var scanButton: some View {
        Button(action: { showPicker = true }) {
            Label("Scan / Select Photo", systemImage: "camera")
                .font(.custom("Verdana", size: 18))
                .frame(maxWidth: .infinity)
                .padding()
                .bold()
                .foregroundColor(Theme.backColor)
                .background(
                    Theme.greenGradient
                        .cornerRadius(14)
                        .shadow(color: Theme.glowGreen.opacity(isScanButtonPressed ? 0.8 : 0.5), radius: 12)
                )
                .scaleEffect(isScanButtonPressed ? 0.95 : 1.0)
        }
        .padding(.horizontal)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isScanButtonPressed = true }
                .onEnded { _ in isScanButtonPressed = false }
        )
    }
    
    private var resultsBox: some View {
        DarkCard{
            resultStatus
            ingredientsList
            
        }
        .padding()
        .padding(.top, -30)
    }
    
    private var resultStatus: some View {
        HStack(alignment: .top) {
            if detectedMatches.isEmpty {
                Image(systemName: "checkmark.circle.fill")
                    .padding(10)
                    .foregroundColor(Theme.primaryGreen)
                    .font(.system(size: 30))

                
                Text("Food is \(selectedCategory.rawValue.capitalized)")
                    .font(.headline)
                    .foregroundColor(Theme.primaryGreen)
                    .bold()
                    .padding(10)
                    .cornerRadius(12)
            } else {
                VStack(spacing: 6) {
                    Text("⚠️ Not \(selectedCategory.rawValue.capitalized)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .bold()
                    
                    Text("Contains: \(detectedMatches.map { $0.capitalized }.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(10)
                .background(Color.black.opacity(0.25))
                .cornerRadius(12)
            }
            
            Button(action: { speakResult() }) {
                Image(systemName: "speaker.wave.2.fill")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        LinearGradient(
                            colors: [Theme.primaryGreen, Theme.accentColor],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                    .shadow(color: Theme.glowGreen.opacity(0.5), radius: 5, x: 0, y: 0)
            }
        }
    }
    
    private var ingredientsList: some View {
        VStack(alignment: .leading) {
            Text("Ingredients Detected:")
                .font(.headline)
                .foregroundStyle(Theme.primaryGreen)
                .multilineTextAlignment(.leading)
            
            if !ingredientWords.isEmpty {
                ScrollView {
                    Text(buildHighlightedIngredientsText())
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.25))
                        )
                        .onTapGesture {
                            let ingredientText = ingredientWords.joined(separator: ", ")
                            speak("Ingredients detected: \(ingredientText)")
                        }
                }
                .frame(maxHeight: 250)
            }
        }
    }
    
    private var instructionsBox: some View {
        Text("Take/Upload a Picture of Your Ingredient List")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.white.opacity(0.9))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Theme.lightGreen.opacity(0.35))
            )
            .padding(.horizontal)
            .padding(.top, -25)
    }
    
    private var tipBox: some View {
        
//        HStack{
//            Image(systemName: "lightbulb")
//                .foregroundColor(Theme.primaryGreen)
//                .padding()
//                .font(Font.system(size: 30))
//            
//            Spacer()
//                            
//            Text("Tip: Use good lighting and a clear image of the ingredient label. *Scanner may make mistakes.")
//            
//                .font(.subheadline)
//                .foregroundColor(.white.opacity(0.5))
//                .fixedSize(horizontal: false, vertical: true)
//                .padding()
//        }
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Theme.primaryGreen)
                    .font(.system(size: 22))
                    

                Text("Use good lighting and a clear image of the ingredient label. The scanner may make mistakes.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()

                Button(action: {
                    showTip = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white.opacity(0.4))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
        
    }
    
    // MARK: - Functions
    
    private func speakResult() {
        if detectedMatches.isEmpty {
            speak("Food is \(selectedCategory.rawValue.capitalized)")
        } else {
            let items = detectedMatches.map { $0.capitalized }.joined(separator: ", ")
            speak("Not \(selectedCategory.rawValue.capitalized). Contains: \(items)")
        }
    }
    
    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        utterance.rate = 0.4
        speechSynthesizer.stopSpeaking(at: .immediate)
        speechSynthesizer.speak(utterance)
    }
    
    private func clearScreen() {
        scannedText = ""
        detectedMatches = []
        ingredientWords = []
        capturedImage = nil
    }
    
    private func scanImage(_ image: UIImage) {
        IngredientScanner.scanIngredientsWithMatches(from: image) { (text: String, results: [IngredientCategory: [String]]) in
            DispatchQueue.main.async {
                scannedText = text
                detectedMatches = results[selectedCategory] ?? []
                
                ingredientWords = text
                    .components(separatedBy: CharacterSet(charactersIn: ",\n"))
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                
                user.addScan(category: selectedCategory, matches: detectedMatches)
            }
        }
    }
    
    private func buildHighlightedIngredientsText() -> AttributedString {
        var result = AttributedString("")
        
        for (index, word) in ingredientWords.enumerated() {
            var attributedWord = AttributedString(word)
            
            if detectedMatches.contains(where: { word.lowercased().contains($0.lowercased()) }) {
                attributedWord.foregroundColor = .red
                attributedWord.font = .subheadline.bold()
            } else {
                attributedWord.foregroundColor = .white
            }
            
            if index < ingredientWords.count - 1 {
                attributedWord.append(AttributedString(", "))
            }
            
            result.append(attributedWord)
        }
        
        return result
    }
}

#Preview{
    ScannerView()
}
