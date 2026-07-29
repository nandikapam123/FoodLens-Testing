//
//  MealSuggestionsView.swift
//

import SwiftUI
import SwiftData

struct MealSuggestionsView: View {
    
    @Environment(\.userSession) var user
    @Environment(\.modelContext) private var context
    
    @Query(sort: \RecipeEntity.createdAt, order: .reverse)
    private var recipes: [RecipeEntity]
    
    // MARK: - User Input
    
    @State var ingredients = ""
    @State var preferences: [String] = []
    
    // MARK: - Backend
    
    @State private var backendRecipes: [RecipeAPI] = []
    @State private var isLoadingRecipes = false
    @State private var recipeError: String?
    
    // MARK: - UI State
    
    @State var showRecipe: Bool = false
    @State var selectedRecipe: RecipeShow?
    @State private var isButtonPressed: Bool = false
    @State private var isLoading: Bool = false
    
    @FocusState private var focusedField: String?
    @FocusState private var focusedField2: String?
    
    
    var body: some View {
        ZStack {
            Theme.backColor.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    
                    PageHeader(
                        title: "Discover",
                        subtitle: "Tell us what's in your kitchen and we'll suggest meals tailored to your taste and dietary needs."
                    )
                    .padding(.bottom, -15)
                    
                    DarkCard {
                        // Ingredients section
                        ingredientsSection
                        
                        preferencesSection
                            .padding(.bottom, 6)
                        
                        preferenceChips
                    }
                    .padding()
                    .padding(.bottom, -10)
                    
                    
                    // MARK: - Generate Recipe
                    
                    Button {
                        isLoading = true
                        focusedField = nil
                        focusedField2 = nil
                        
                        AIService.generateRecipe(
                            ingredients: ingredients,
                            preferences: preferences.joined(separator: ", ")
                        ) { result in
                            
                            switch result {
                            case .success(let recipe):
                                
                                let newRecipe = RecipeEntity(
                                    name: recipe.name,
                                    recipeDescription: recipe.description,
                                    ingredients: recipe.ingredients,
                                    steps: recipe.steps,
                                    tips: recipe.tips
                                )
                                
                                context.insert(newRecipe)
                                
                                DispatchQueue.main.async {
                                    isLoading = false
                                }
                                
                            case .failure(let error):
                                print("Error:", error)
                                
                                DispatchQueue.main.async {
                                    isLoading = false
                                }
                            }
                        }
                        
                    } label: {
                        Text("Generate Recipe")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .bold()
                            .foregroundColor(Theme.backColor)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Theme.primaryGreen,
                                        Theme.accentColor
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .cornerRadius(14)
                                .shadow(
                                    color: Theme.glowGreen.opacity(
                                        isButtonPressed ? 0.8 : 0.5
                                    ),
                                    radius: 12,
                                    x: 0,
                                    y: 4
                                )
                            )
                            .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                    }
                    .padding(.horizontal)
                    .padding(.top, -10)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                isButtonPressed = true
                            }
                            .onEnded { _ in
                                isButtonPressed = false
                            }
                    )
                    .disabled(ingredients == "")
                    .opacity(ingredients == "" ? 0.5 : 1)
                    
                    
                    // MARK: - AI Loading
                    
                    if isLoading {
                        VStack(spacing: 12) {
                            ProgressView()
                                .tint(Theme.primaryGreen)
                            
                            Text("Generating your recipe...")
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding()
                    }
                    
                    
                    // MARK: - Backend Loading
                    
                    if isLoadingRecipes {
                        VStack(spacing: 10) {
                            ProgressView()
                                .tint(Theme.primaryGreen)
                            
                            Text("Loading saved recipes...")
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding()
                    }
                    
                    
                    // MARK: - Backend Error
                    
                    if let recipeError {
                        Text("Backend error: \(recipeError)")
                            .font(.caption)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    
                    // MARK: - Backend Success Diagnostic
                    
                    if !backendRecipes.isEmpty {
                        Text("Backend: \(backendRecipes.count) recipes loaded")
                            .font(.caption)
                            .foregroundColor(Theme.primaryGreen)
                    }
                    
                    
                    // MARK: - Empty State
                    
                    if recipes.isEmpty &&
                        backendRecipes.isEmpty &&
                        !isLoading &&
                        !isLoadingRecipes {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "sparkles")
                                .font(.system(size: 40))
                                .foregroundColor(
                                    Theme.primaryGreen.opacity(0.7)
                                )
                            
                            Text("Your AI chef is ready")
                                .font(
                                    .system(
                                        size: 18,
                                        weight: .semibold,
                                        design: .rounded
                                    )
                                )
                                .foregroundColor(.white)
                            
                            Text(
                                "Enter ingredients and preferences to generate a custom recipe"
                            )
                            .font(
                                .system(
                                    size: 14,
                                    weight: .regular,
                                    design: .rounded
                                )
                            )
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        }
                        .padding(.top, 5)
                    }
                    
                    
                    // MARK: - Backend Recipes
                    
                    if !backendRecipes.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Recipes From FoodLens")
                                .font(
                                    .system(
                                        size: 20,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            ForEach(backendRecipes) { recipe in
                                
                                BackendRecipeCard(
                                    recipe: recipe,
                                    selectedRecipe: $selectedRecipe
                                )
                            }
                        }
                    }
                    
                    
                    // MARK: - Locally Generated Recipes
                    
                    if !recipes.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Your Generated Recipes")
                                .font(
                                    .system(
                                        size: 20,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            ForEach(recipes) { recipe in
                                
                                PostMeal(
                                    meal: RecipeShow(
                                        name: recipe.name,
                                        description: recipe.recipeDescription,
                                        ingredients: recipe.ingredients,
                                        steps: recipe.steps,
                                        tips: recipe.tips
                                    ),
                                    selectedMeal: $selectedRecipe
                                )
                            }
                            .onDelete { indexSet in
                                for index in indexSet {
                                    context.delete(recipes[index])
                                }
                            }
                        }
                    }
                    
                    
                    Spacer()
                    Spacer()
                }
                .padding(.vertical)
            }
        }
        .task {
            loadBackendRecipes()
        }
        .sheet(item: $selectedRecipe) { recipe in
            FullMealView(recipe: recipe)
        }
    }
    
    
    // MARK: - Backend
    
    private func loadBackendRecipes() {
        isLoadingRecipes = true
        recipeError = nil
        
        Task {
            do {
                let recipes = try await BackendService.shared.getRecipes()
                
                await MainActor.run {
                    backendRecipes = recipes
                    isLoadingRecipes = false
                }
                
            } catch {
                
                await MainActor.run {
                    recipeError = error.localizedDescription
                    isLoadingRecipes = false
                }
                
                print("Failed to load recipes: \(error)")
            }
        }
    }
    
    
    // MARK: - Preference Chips
    
    private var preferenceChips: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                ForEach(
                    ["Vegan", "High Protein", "Low Carb", "Quick Meals"],
                    id: \.self
                ) { item in
                    
                    Text(item)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Theme.lightGreen.opacity(0.2)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .onTapGesture {
                            
                            if !preferences.contains(item) {
                                preferences.append(item)
                            }
                        }
                }
            }
        }
    }
    
    
    // MARK: - Field Background
    
    private func fieldBackground(isFocused: Bool) -> some View {
        
        RoundedRectangle(cornerRadius: 16)
            .fill(
                Theme.lightGreen.opacity(0.15)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isFocused
                        ? Theme.primaryGreen
                        : Theme.primaryGreen.opacity(0.3),
                        lineWidth: 2
                    )
            )
            .shadow(
                color: isFocused
                ? Theme.primaryGreen.opacity(0.8)
                : .clear,
                radius: 10
            )
    }
    
    
    // MARK: - Preferences
    
    private var preferencesSection: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Preferences")
                .foregroundColor(Theme.primaryGreen)
                .font(
                    .system(
                        size: 18,
                        weight: .semibold,
                        design: .rounded
                    )
                )
                .padding(.bottom, 3)
            
            TextField(
                "",
                text: Binding(
                    get: {
                        preferences.joined(separator: ", ")
                    },
                    set: { newValue in
                        preferences = newValue
                            .split(separator: ",")
                            .map {
                                $0.trimmingCharacters(
                                    in: .whitespaces
                                )
                            }
                    }
                )
            )
            .padding()
            .background(
                fieldBackground(
                    isFocused: focusedField2 == "preferences"
                )
            )
            .foregroundColor(.white)
            .tint(Theme.primaryGreen)
            .focused(
                $focusedField2,
                equals: "preferences"
            )
            .padding(.horizontal)
        }
    }
    
    
    // MARK: - Ingredients
    
    private var ingredientsSection: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Ingredients")
                .foregroundColor(Theme.primaryGreen)
                .font(
                    .system(
                        size: 18,
                        weight: .semibold,
                        design: .rounded
                    )
                )
                .padding(.bottom, 3)
            
            TextField(
                "",
                text: $ingredients
            )
            .padding()
            .background(
                fieldBackground(
                    isFocused: focusedField == "ingredients"
                )
            )
            .foregroundColor(Theme.lightGreen)
            .tint(Theme.primaryGreen)
            .focused(
                $focusedField,
                equals: "ingredients"
            )
            .padding(.horizontal)
        }
    }
}


// MARK: - Backend Recipe Card

struct BackendRecipeCard: View {
    
    let recipe: RecipeAPI
    
    @Binding var selectedRecipe: RecipeShow?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(recipe.title)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(recipe.description!)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(2)
            
            Button {
                
                selectedRecipe = RecipeShow(
                    name: recipe.title,
                    description: recipe.description!,
                    ingredients: nil,
                    steps: recipe.instructions
                        .components(separatedBy: ". ")
                        .filter { !$0.isEmpty },
                    tips: nil
                )
                
            } label: {
                
                Text("View Full Recipe")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(
                        Theme.backColor.opacity(0.8)
                    )
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(
            Theme.lightGreen
                .cornerRadius(16)
                .shadow(
                    color: Theme.primaryGreen.opacity(0.8),
                    radius: 18,
                    x: 0,
                    y: 0
                )
        )
        .padding(.horizontal)
    }
}


// MARK: - Local Recipe Card

struct PostMeal: View {
    
    let meal: RecipeShow
    @Binding var selectedMeal: RecipeShow?
    
    @State private var isButtonPressed = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(meal.name)
                .font(.headline)
                .foregroundColor(.black)
            
            Text(meal.description)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(2)
            
            Button {
                selectedMeal = meal
                
            } label: {
                
                Text("View Full Recipe")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(
                        Theme.backColor.opacity(0.8)
                    )
                    .cornerRadius(12)
                    .shadow(
                        color: Theme.glowGreen.opacity(
                            isButtonPressed ? 0.8 : 0.4
                        ),
                        radius: 6,
                        x: 0,
                        y: 3
                    )
                    .scaleEffect(
                        isButtonPressed ? 0.95 : 1.0
                    )
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isButtonPressed = true
                    }
                    .onEnded { _ in
                        isButtonPressed = false
                    }
            )
        }
        .padding()
        .background(
            Theme.lightGreen
                .cornerRadius(16)
                .shadow(
                    color: Theme.primaryGreen.opacity(0.8),
                    radius: 18,
                    x: 0,
                    y: 0
                )
        )
        .padding(.horizontal)
    }
}


// MARK: - Clear Local Recipes

func clearRecipesOnLogin(context: ModelContext) {
    
    let descriptor = FetchDescriptor<RecipeEntity>()
    
    if let recipes = try? context.fetch(descriptor) {
        
        recipes.forEach {
            context.delete($0)
        }
        
        do {
            try context.save()
            
        } catch {
            print(
                "Failed to clear recipes:",
                error
            )
        }
    }
}



