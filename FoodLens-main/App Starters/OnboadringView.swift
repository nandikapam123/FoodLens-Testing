//
//  OnBoardingView.swift
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isLoggedIn: Bool
    @Environment(\.userSession) var user
    @Environment(\.modelContext) private var context
    @State private var step = 1
    
    // For Step 1
    @State private var name = ""
    @State private var username = ""
    
    // For Step 2
    @State private var preferences = ""
    @State private var accountType = "Basic"
    let accountTypes = ["Basic", "Premium"]
    
    var isStep1Valid: Bool {
        !name.isEmpty && !username.isEmpty
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Theme.backColor, Color.black],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                if step == 1 {
                    stepOne
                } else {
                    stepTwo
                }
                
                Spacer()
                
                actionButton
            }
            .padding()
        }
    }

    var stepOne: some View {
        VStack(spacing: 25) {
            Text("FoodLens")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(Theme.primaryGreen)
            
            Text("Scan food. Find recipes. Eat smarter.")
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
            
            inputField(icon: "person", placeholder: "Name", text: $name)
            inputField(icon: "at", placeholder: "Username", text: $username)
        }
    }
    

    var stepTwo: some View {
        VStack(spacing: 25) {
            Text("Your Preferences")
                .font(.title2.bold())
                .foregroundColor(Theme.primaryGreen)
            
            inputField(icon: "fork.knife", placeholder: "e.g. halal, vegan, gluten-free", text: $preferences)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Account Type")
                    .foregroundColor(Theme.primaryGreen)
                    .bold()
                
                HStack {
                    ForEach(accountTypes, id: \.self) { type in
                        accountCard(type: type)
                    }
                }
            }
        }
    }
    
    func inputField(icon: String, placeholder: String, text: Binding<String>) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Theme.primaryGreen)
            
            TextField(placeholder, text: text)
                .foregroundColor(.white)
                .autocapitalization(.none)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Theme.lightGreen.opacity(0.25))
        )
    }
    
    func accountCard(type: String) -> some View {
        let isSelected = accountType == type
        
        return Text(type)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? Theme.primaryGreen : Theme.lightGreen.opacity(0.2))
            )
            .foregroundColor(isSelected ? Theme.backColor : .white)
            .onTapGesture {
                accountType = type
            }
    }
    
    var actionButton: some View {
        Button(action: {
            if step == 1 {
                withAnimation {
                    step = 2
                }
            } else {
                clearRecipesOnLogin(context: context)
                user.name = name
                user.username = username
                user.preferences = preferences
                user.accountType = accountType
                user.selectedTab = .contentView
                
                withAnimation {
                    isLoggedIn = true
                }
            }
        }) {
            Text(step == 1 ? "Continue" : "Get Started")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.greenGradient)
                .foregroundColor(Theme.backColor)
                .cornerRadius(16)
                .bold()
        }
        .disabled(step == 1 && !isStep1Valid)
        .opacity(step == 1 && !isStep1Valid ? 0.6 : 1)
    }
}

