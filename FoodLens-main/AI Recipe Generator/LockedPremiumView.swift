//
//  LockedPremiumView.swift
//

import SwiftUI
struct LockedPremiumView: View {
    
    let feature: String
    let description: String
    
    let image: String
    
    var body: some View {
        ZStack{
//            Theme.lightGreen.ignoresSafeArea()
            
            Image(image)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            
            
            VStack{

                
                VStack(spacing: 20) {
                    
                    Image(systemName: "lock.fill")
                        .font(.system(size: 60))
                        .foregroundColor(Theme.backColor)
                    
                    Text("\(feature) is Premium")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Theme.backColor)
                    
                    Text(description)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Theme.backColor)
                        .padding(.horizontal)
                    
                    Text("Upgrade your account to unlock.")
                        .font(.caption)
                        .foregroundColor(Theme.backColor)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Theme.lightGreen.opacity(0.7))
                .cornerRadius(16)
                .shadow(radius: 6)
                .padding()
            }
//            .background(Theme.lightGreen.ignoresSafeArea())
            .padding(.vertical, 250)
            
        }

    }
}

#Preview{
    LockedPremiumView(feature: "Feature", description: "Description", image: "Locked")
}
