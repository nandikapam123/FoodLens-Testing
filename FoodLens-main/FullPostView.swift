//
//  FullPostView.swift
//

import SwiftUI
struct FullPostView: View {
    let post: CommunityPost
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Theme.backColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 26) {
                    HStack{
                        
                        Text(post.type.rawValue.uppercased())
                            .font(.caption2.bold())
                            .tracking(1.5)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Theme.primaryGreen.opacity(0.2))
                            .foregroundColor(Theme.primaryGreen)
                            .clipShape(Capsule())
                        
                        
                        if post.type == .advertisement {
                            Text("SPONSORED")
                                .font(.caption.bold())
                                .padding(.horizontal, 10)
                                .padding(.vertical, 3)
                                .background(Theme.greenGradient)
                                .foregroundColor(Theme.backColor)
                                .cornerRadius(6)
                        }
                        if post.type == .advertisement {
                            Spacer().frame(maxWidth: 68)
                            
                            Button (action: {dismiss() } ){
                                Image(systemName: "xmark")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(Theme.primaryGreen)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(Color.black.opacity(0.3))
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.4), lineWidth: 1))
                            }
                          
                        } else {
                            
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
                        
                    }
                    .padding(.top, 40)
                    .padding(.bottom, -20)
                    
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(post.title)
                            .font(.system(.largeTitle).bold())
                            .foregroundColor(Theme.primaryGreen)
                            .shadow(color: Theme.primaryGreen.opacity(0.5), radius: 8)
                        
                        if let emailURL = URL(string: "mailto:\(post.contactInfo)") {
                            Link(destination: emailURL) {
                                Label(post.contactInfo, systemImage: "envelope.fill")
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(Theme.primaryGreen)
                            }
                        }
                    }
                    
                    if let image = post.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 220)
                            .frame(maxWidth: 370)
                            .clipped()
                            .cornerRadius(18)
                            .shadow(color: Theme.primaryGreen.opacity(0.4), radius: 10)
                    }
                    
                    ContentCard(title: "Description", systemImage: "text.alignleft") {
                        Text(post.description)
                            .lineSpacing(4)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    
                    // RECIPE CONTENT
                    if post.type == .recipe {
                        
                        if let ingredients = post.ingredients {
                            ContentCard(title: "Ingredients", systemImage: "leaf.fill") {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(ingredients, id: \.self) { item in
                                        Label(item, systemImage: "circle.fill")
                                            .font(.subheadline)
                                            .imageScale(.small)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                }
                            }
                        }
                        
                        if let steps = post.steps {
                            ContentCard(title: "Preparation", systemImage: "checklist") {
                                VStack(alignment: .leading, spacing: 16) {
                                    
                                    ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                                        
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
                    }
                    
                    // FOOD DRIVE CONTENT
                    if post.type == .foodDrive {
                        
                        if !post.volunteerDetails.isEmpty {
                            ContentCard(title: "Volunteer Details", systemImage: "person.3.fill") {
                                Text(post.volunteerDetails)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        
                        if !post.driveLocation.isEmpty {
                            ContentCard(title: "Drive Location", systemImage: "mappin.and.ellipse") {
                                Text(post.driveLocation)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        
                        if !post.missionDescription.isEmpty {
                            ContentCard(title: "Mission", systemImage: "heart.fill") {
                                Text(post.missionDescription)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                    }
                    
                    // STORE PROMOTION CONTENT
                    if post.type == .advertisement {
                        
                        if !post.storeLocation.isEmpty {
                            ContentCard(title: "Store Location", systemImage: "building.2.fill") {
                                Text(post.storeLocation)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        
                        if !post.discountDetails.isEmpty {
                            ContentCard(title: "Promotion Details", systemImage: "tag.fill") {
                                Text(post.discountDetails)
                                    .foregroundColor(.white.opacity(0.9))
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
struct ContentCard<Content: View>: View {
    
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
        .shadow(color: Theme.glowGreen.opacity(0.25), radius: 12)
    }
}
