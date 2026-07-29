//
//  MainTabView.swift
//

import SwiftUI
import SwiftData
struct MainTabView: View {
    
    @Environment(\.userSession) var user
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ScannerView()
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("Scanner")
                }
            
            FindView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Find Food")
                }
            
            MealSuggestionsViewWrapper()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Meals")
                }
            
            CommunityBoardView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Community")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
struct MealSuggestionsViewWrapper: View {
    @Environment(\.userSession) var user
    var body: some View {
        if user.accountType == "Premium" {
            MealSuggestionsView()
                .modelContainer(for: RecipeEntity.self)
        } else {
            LockedPremiumView(
                feature: "AI Recipe Generator",
                description: "Generate personalized meal ideas based on your dietary preferences.",
                image: "Locked"
            )
        }
    }
}

#Preview {
    MainTabView()
}

