//
//  ContentView.swift
//

import SwiftUI

//struct ContentView: View {
//    @Environment(\.userSession) var user
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                Theme.backColor.ignoresSafeArea()
//                
//                ScrollView {
//                    VStack(spacing: 10) {
//                        Theme.backColor.ignoresSafeArea()
//                        
//                        // Greeting
//                        Text("Welcome, \(user.name)")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(Theme.primaryGreen)
//                            .shadow(color: Theme.glowGreen.opacity(0.5), radius: 8)
//                        
//                        // Feature Cards
//                        FeatureCard(
//                            title: "AI Recipe Generator",
//                            description: "AI-powered meals based on your preferences.",
//                            isPremium: false,
//                            isUnlocked: true
//                        )
//                        .cardStyle()
//                        
//                        FeatureCard(
//                            title: "Food Finder",
//                            description: "Find Nutritious, Affordable, and Delicious Food In Your Local Community",
//                            isPremium: false,
//                            isUnlocked: true
//                        )
//                        .cardStyle()
//                        
//                        FeatureCard(
//                            title: "Community Board",
//                            description: "Stay Updated on Local Food Drives and Events",
//                            isPremium: true,
//                            isUnlocked: user.accountType == "Premium"
//                        )
//                        .cardStyle()
//                        
//                        FeatureCard(
//                            title: "Food Scanner",
//                            description: "Scan product labels for allergens and dietary conflicts.",
//                            isPremium: true,
//                            isUnlocked: user.accountType == "Premium"
//                        )
//                        .cardStyle()
//                        
//                        Spacer()
//                    }
//                    .padding(.top, -25)
//                    .padding()
//                }
//            }
//        }
//    }
//}
//// MARK: - FeatureCard Visual Modifier
//extension View {
//    func cardStyle() -> some View {
//        self
//            .padding()
//            .background(
//                LinearGradient(
//                    gradient: Gradient(colors: [Theme.primaryGreen.opacity(0.4), Theme.accentColor.opacity(0.3)]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .cornerRadius(16)
//            .shadow(color: Theme.glowGreen.opacity(0.4), radius: 10, x: 0, y: 5)
//    }
//}


// Second option
//struct ContentView: View {
//    @Environment(\.userSession) var user
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Theme.backColor.ignoresSafeArea()
//                
//                ScrollView {
//                    VStack(spacing: 24) {
//                        
//                        header
//                        primaryFeature
//                        featureGrid
//                        premiumSection
//                        
//                        Spacer(minLength: 40)
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//    
//    // MARK: - Header
//    private var header: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            Text("Welcome back,")
//                .foregroundColor(.white.opacity(0.7))
//            
//            Text(user.name)
//                .font(.largeTitle)
//                .bold()
//                .foregroundColor(Theme.primaryGreen)
//                .shadow(color: Theme.glowGreen.opacity(0.5), radius: 6)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//    }
//    
//    // MARK: - Primary Feature (AI Recipes)
//    private var primaryFeature: some View {
//        NavigationLink(destination: MealSuggestionsView()) {
//            VStack(alignment: .leading, spacing: 12) {
//                
//                HStack {
//                    Image(systemName: "sparkles")
//                        .font(.title)
//                    Spacer()
//                }
//                
//                Text("AI Recipe Generator")
//                    .font(.title2)
//                    .bold()
//                
//                Text("Create meals instantly based on what you have")
//                    .font(.subheadline)
//                    .opacity(0.8)
//            }
//            .foregroundColor(.white)
//            .padding()
//            .frame(maxWidth: .infinity, minHeight: 140)
//            .background(
//                LinearGradient(
//                    colors: [Theme.primaryGreen, Theme.accentColor],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .cornerRadius(20)
//            .shadow(color: Theme.glowGreen.opacity(0.5), radius: 12)
//        }
//    }
//    
//    // MARK: - Feature Grid
//    private var featureGrid: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            
//            Text("Explore")
//                .font(.headline)
//                .foregroundColor(.white.opacity(0.8))
//            
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                
//                featureTile(
//                    title: "Food Finder",
//                    icon: "map.fill",
//                    destination: FindView()
//                )
//                
//                featureTile(
//                    title: "Scanner",
//                    icon: "camera.fill",
//                    destination: ScannerView()
//                )
//            }
//        }
//    }
//    
//    // MARK: - Premium Section
//    private var premiumSection: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            
//            Text("Premium")
//                .font(.headline)
//                .foregroundColor(.white.opacity(0.8))
//            
//            featureTile(
//                title: "Community Board",
//                icon: "person.3.fill",
//                destination: CommunityBoardView(),
//                locked: user.accountType != "Premium"
//            )
//        }
//    }
//    
//    // MARK: - Reusable Tile
//    private func featureTile<Destination: View>(
//        title: String,
//        icon: String,
//        destination: Destination,
//        locked: Bool = false
//    ) -> some View {
//        
//        NavigationLink(destination: destination) {
//            VStack(spacing: 12) {
//                
//                Image(systemName: icon)
//                    .font(.title2)
//                
//                Text(title)
//                    .font(.subheadline)
//                    .bold()
//                    .multilineTextAlignment(.center)
//                
//                if locked {
//                    Text("Premium")
//                        .font(.caption2)
//                        .padding(4)
//                        .background(Color.white.opacity(0.2))
//                        .cornerRadius(6)
//                }
//            }
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, minHeight: 110)
//            .background(
//                RoundedRectangle(cornerRadius: 18)
//                    .fill(Theme.lightGreen.opacity(0.25))
//            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 18)
//                    .stroke(Theme.primaryGreen.opacity(0.3), lineWidth: 1)
//            )
//            .opacity(locked ? 0.5 : 1)
//        }
//    }
//}


// Home View
import SwiftUI

struct ContentView: View {
    @Environment(\.userSession) var user
    
    @State private var greeting: String = ""
    @State private var insight: String = "Loading your insight..."
    
    var body: some View {
            ZStack {
                Theme.backColor.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 22) {
                        header
                        intelligenceCard
                        insightsSection
                        activityFeed
                        communityPulse
                        Spacer(minLength: 30)
                    }
                    .padding()
                }
            }
            // --- Populate both on appear ---
            .onAppear {
                greeting = timeBasedGreeting()
                AIService.generateHomeInsight { result in
                    if case .success(let text) = result {
                        insight = text
                    }
                }
            }
    }

        // --- Real greeting logic ---
    private func timeBasedGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:  return "Good morning,"
        case 12..<17: return "Good afternoon,"
        case 17..<21: return "Good evening,"
        default:      return "Good night,"
        }
    }
    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(greeting)                          // ← was "timeBasedGreeting()"
                .font(.headline)
                .foregroundColor(.white.opacity(0.7))
            Text(user.name)
                .font(.largeTitle.bold())
                .foregroundColor(Theme.primaryGreen)
            Text("Here's your food overview")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var intelligenceCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's Insight")
                .font(.headline)
                .foregroundColor(.white)
            Text(insight)                           // ← was "generateSmartInsight()"
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            HStack {
                Text("Tap radial menu → to act")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                Spacer()
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(Theme.primaryGreen)
            }
        }
        .padding()
        .background(Theme.lightGreen.opacity(0.2))
        .cornerRadius(18)
    }
    
    private var insightsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Your Patterns")
                .foregroundColor(.white.opacity(0.7))
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("• 3 scans this week")
                Text("• Mostly gluten-free selections")
                Text("• 2 recipes saved")
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Theme.lightGreen.opacity(0.15))
            .cornerRadius(16)
        }
    }
    
    
    private var activityFeed: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Recent Activity")
                .foregroundColor(.white.opacity(0.7))
                .font(.headline)
            
            VStack(spacing: 10) {
                activityRow("Scanned product", "Gluten-Free check passed")
                activityRow("Generated recipe", "High protein pasta")
                activityRow("Search", "Nearby grocery stores")
            }
        }
    }
    private func activityRow(_ title: String, _ subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundColor(.white)
                .font(.subheadline.bold())
            
            Text(subtitle)
                .foregroundColor(.white.opacity(0.6))
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.lightGreen.opacity(0.1))
        .cornerRadius(14)
    }
    private var communityPulse: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Community Pulse")
                .foregroundColor(.white.opacity(0.7))
                .font(.headline)
            
            Text("🔥 Food drive this weekend near you")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Theme.lightGreen.opacity(0.15))
                .cornerRadius(16)
        }
    }
}

#Preview {
    ContentView()
}
