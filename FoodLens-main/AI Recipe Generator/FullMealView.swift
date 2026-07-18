//
//  FullMealView.swift
//  FoodLens
//



import SwiftUI
struct FullMealView: View {
    let recipe: RecipeShow
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Theme.backColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 26) {
                    
                    HStack{
                        
                        Text("AI Generate Recipe")
                            .font(.caption2.bold())
                            .tracking(1.5)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Theme.primaryGreen.opacity(0.2))
                            .foregroundColor(Theme.primaryGreen)
                            .clipShape(Capsule())
                        
                        // OLD VERSIONSS
//                        Button(action: { dismiss() }) {
//                            Image(systemName: "xmark")
//                                .fontWeight(.semibold)
//                                .foregroundColor(Theme.primaryGreen)
//                                .padding(.horizontal, 8)
//                                .padding(.vertical, 8)
//                                .background(Theme.lightGreen.opacity(0.25))
//                                .clipShape(Capsule())
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 24)
//                                        .stroke(Theme.lightGreen.opacity(0.4), lineWidth: 1)
//                                )
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                        
                        Button (action: {dismiss() } ){
                            Image(systemName: "xmark")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Theme.primaryGreen)
                                .padding(9)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.4), lineWidth: 1))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    }
                    .padding(.top, 40)
                    .padding(.bottom, -20)
                    
                    
                    
                    // HEADER
                    VStack(alignment: .center) {
                        Text(recipe.name)
                            .font(recipe.name.split(separator: " ").count > 2 ? .system(.title).bold() : .system(.largeTitle).bold())
                            .foregroundColor(Theme.primaryGreen)
                            .shadow(color: Theme.primaryGreen.opacity(0.5), radius: 8)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    // DESCRIPTION
                    ContentCardMeal(title: "Description", systemImage: "text.alignleft") {
                        Text(recipe.description)
                            .lineSpacing(0)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, -10)
                    
                    
                    // RECIPE CONTEN
                    ContentCardMeal(title: "Ingredients", systemImage: "leaf.fill") {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(recipe.ingredients!, id: \.self) { item in
                                Label(item, systemImage: "circle.fill")
                                    .font(.subheadline)
                                    .imageScale(.small)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                    }
                    
                    
                    
                    ContentCardMeal(title: "Preparation", systemImage: "checklist") {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            ForEach(Array(recipe.steps!.enumerated()), id: \.offset) { index, step in
                                
                                HStack(alignment: .top, spacing: 12) {
                                    
                                    Text("\(index + 1)")
                                        .font(.caption.bold())
                                        .foregroundColor(Theme.primaryGreen)
                                        .frame(width: 24, height: 24)
                                        .background(Theme.primaryGreen.opacity(0.15))
                                        .clipShape(Circle())
                                    
                                    Text(step)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
}

struct ContentCardMeal<Content: View>: View {
    
    let title: String
    let systemImage: String
    let content: Content
    
    init(title: String, systemImage: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.systemImage = systemImage
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundColor(Theme.primaryGreen)
            
            content
        }
        .padding(22)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 22).fill(Color(.black.opacity(0.3)))
                RoundedRectangle(cornerRadius: 22).fill(Theme.lightGreen.opacity(0.10))
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Theme.lightGreen.opacity(0.35), lineWidth: 1)
            }
        )
    }
}

