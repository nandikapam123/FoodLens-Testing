//
//  FeatureCard.swift
//

import SwiftUI
struct FeatureCard: View {
    
    let title: String
    let description: String
    let isPremium: Bool
    let isUnlocked: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(title)
                    .font(.headline)
                
                if isPremium {
                    Spacer()
                    Text("PREMIUM")
                        .font(.caption)
                        .padding(6)
                        .background(Theme.primaryGreen.opacity(0.2))
                        .cornerRadius(6)
                }
            }
            
            Text(description)
                .font(.subheadline)
            
            if !isUnlocked {
                Text("Upgrade to Premium to unlock")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.lightGreen)
        .cornerRadius(16)
        .opacity(isUnlocked ? 1 : 0.6)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview{
    FeatureCard(title: "Name", description: "Description", isPremium: true, isUnlocked: false)
}


