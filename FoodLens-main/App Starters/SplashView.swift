//
//  SplashView.swift
//

import SwiftUI
import Combine
struct SplashView: View {
    
    @Environment(\.userSession) var user
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    @State private var slogan: String = "Eat healthy, live happy!"
    @State private var isButtonPressed = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [Theme.backColor, Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Optional faint background image (like abstract food shapes)
                Image("SplashPic")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Food Lens with glowing effect
                    Section{
                        Text("FoodLens")
                            .font(.system(size: 52, weight: .bold))
                            .foregroundColor(Theme.primaryGreen)
                            .shadow(color: Theme.glowGreen, radius: 15, x: 0, y: 0)
                            .shadow(color: Theme.glowGreen.opacity(0.5), radius: 30, x: 0, y: 0)
                            .padding(.bottom, -20)
                        
                        // Slogan card with glass effect
                        Text(slogan)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                    }
                    
                    // Navigation button with gradient & glow
                    NavigationLink(destination: OnboardingView(isLoggedIn: $isLoggedIn)) {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Theme.backColor)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 120)
                            .background(
                                Theme.greenGradient
                                    .cornerRadius(16)
                                    .shadow(color: Theme.glowGreen.opacity(0.6), radius: isButtonPressed ? 20 : 10, x: 0, y: 0)
                            )
                            .scaleEffect(isButtonPressed ? 0.9 : 1.0)
                            
                    }
                    
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in isButtonPressed = true }
                            .onEnded { _ in isButtonPressed = false }
                    )
                    Spacer().frame(height: 100)
                    
                }
                
                .padding()
            }
        }
    }
}

#Preview{
    SplashView()
}
