//
//  PageHeader.swift
//  FoodLens
//

import SwiftUI

struct PageHeader: View {
    let title: String
    var subtitle: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text(title)
                .font(.system(size: 40, weight: .bold, design: .default))
                .kerning(-0.6)
                .foregroundStyle(
                    Theme.primaryGreen
                )
                .shadow(color: Theme.glowGreen.opacity(0.6), radius: 10)
                
            if let subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.38))
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Accent divider
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Theme.primaryGreen, Theme.primaryGreen.opacity(0)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 40, height: 5)
                .cornerRadius(5)
                .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
        .padding(.horizontal, 20)
    }
}


#Preview{
    PageHeader(title: "Ttiel", subtitle: "Subtitle")
}
