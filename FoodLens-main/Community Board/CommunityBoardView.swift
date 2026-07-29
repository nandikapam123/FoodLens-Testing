//
//  CommunityBoardView.swift
//

import SwiftUI
struct CommunityBoardView: View {
    
    @Environment(\.userSession) var user
    
    @State private var posts: [CommunityPost] = [
        CommunityPost(
            type: .recipe,
            title: "Vegan Pasta",
            description: "Delicious vegan pasta.",
            contactInfo: "veganchef@example.com",
            image: UIImage(named: "VeganPasta"),
            ingredients: ["Pasta", "Tomatoes", "Basil"],
            steps: ["Boil pasta", "Mix Sauce", "Top with Basil"],
            volunteerDetails: "",
            driveLocation: "",
            missionDescription: "",
            storeLocation: "",
            discountDetails: "",
            postedByPremium: true
        ),
        CommunityPost(
            type: .foodDrive,
            title: "Community Food Drive",
            description: "Help distribute meals!",
            contactInfo: "fooddrive@example.com",
            image: UIImage(named: "FoodDrive"),
            ingredients: nil,
            steps: nil,
            volunteerDetails: "Help set up and hand count food at the food drive.",
            driveLocation: "123 Anytown Food Bank",
            missionDescription: "Togther we can makes sure every child has access to consistent, nutrious food!",
            storeLocation: "",
            discountDetails: "",
            postedByPremium: true
        ),
        CommunityPost(
            type: .advertisement,
            title: "Green Grocery",
            description: "20% Off All Fruits this Weekend",
            contactInfo: "foodStore@example.com",
            image: UIImage(named: "Grocery"),
            ingredients: nil,
            steps: nil,
            volunteerDetails: "",
            driveLocation: "",
            missionDescription: "",
            storeLocation: "456 BestTown Street",
            discountDetails: "Only at select stores Green Grocery is offering 20% off all fruits this weekend to encourage fresh, healthy eating for the whole community.",
            postedByPremium: true
        )
    ]
    
    @State private var showNewPost = false
    @State private var selectedPost: CommunityPost?
    @State private var dontShowNewPost = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    // Old STUFFFFF
//                    HStack{
//                        if user.accountType == "Premium" {
//                            Button(action: { showNewPost = true }) {
//                                Image(systemName: "plus.circle.fill")
//                                    .font(.title)
//                                    .foregroundColor(Theme.primaryGreen)
//                                    .shadow(color: Theme.glowGreen.opacity(0.5), radius: 4)
//                            }
//                        }
//                    }
                    // Header
//                    HStack {
//                        Text("Community Board")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(Theme.primaryGreen)
//                            .shadow(color: Theme.glowGreen.opacity(0.5), radius: 8)
//                        
//                        Spacer()
//
//                            if user.accountType == "Premium" {
//                                Button { showNewPost = true } label: {
//                                    Image(systemName: "square.and.pencil")
//                                        .font(.system(size: 16, weight: .semibold))
//                                        .foregroundColor(Theme.primaryGreen)
//                                        .padding(9)
//                                        .background(Theme.lightGreen.opacity(0.15))
//                                        .cornerRadius(10)
//                                        .overlay(
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .stroke(Theme.primaryGreen.opacity(0.4), lineWidth: 1)
//                                        )
//                                }
//                            }
                        
//                        if user.accountType == "Premium" {
//                            Button { showNewPost = true } label: {
//                                Image(systemName: "plus")
//                                    .font(.system(size: 14, weight: .bold))
//                                    .foregroundColor(Theme.primaryGreen)
//                                    .padding(9)
//                                    .background(Color(.black.opacity(0.3)))
//                                    .clipShape(Circle())
//                                    .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.4),lineWidth: 1))
//                            }
//                        }
//                        
//                    }
//                    .padding(.top, -3)
//                    .padding(.horizontal)
//                    .padding(.bottom, -10)
                    
                    // Header #2
                    ZStack(alignment: .topTrailing) {
                        PageHeader(
                            title: "Community",
                            subtitle: "Browse recipes, local food drives, and store promotions shared by people in your community"
                        )
                        .padding(.top, -10)
                        .padding(.bottom, 10)

                        Button {
                            if user.accountType == "Premium"{
                                showNewPost = true
                            }
                            
                            else{
                                dontShowNewPost = true
                            }
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Theme.primaryGreen)
                                .padding(9)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.4), lineWidth: 1))
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 8)
                        
                    }
                    
                    // Posts List
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(posts, id: \.id) { post in
                                CommunityPostRow(post: post, selectedPost: $selectedPost)
                            }
                        }
                    }
                }
                .background(Image("SplashPic").overlay(Theme.backColor.opacity(0.7)))
                .padding(.vertical)
                
                // New Post Sheet
                .sheet(isPresented: $showNewPost) {
                    NewCommunityPostView() { newPost in
                        posts.insert(newPost, at: 0)
                        showNewPost = false
                    }
                }
                .sheet(isPresented: $dontShowNewPost) {
                    LockedPremiumView(feature: "New Post", description: "Share recipes, food drives, and store promotions with your community", image: "Locked2")
                }
                // Full Post Sheet
                .sheet(item: $selectedPost) { post in
                    FullPostView(post: post)
                }
                
                // MORE OLD STUFFFF
                
//                if user.accountType == "Premium" {
//                        VStack {
//                            Spacer()
//                            HStack {
//                                Spacer()
//                                Button(action: { showNewPost = true }) {
//                                    Image(systemName: "plus")
//                                        .font(.title2.bold())
//                                        .foregroundColor(Theme.backColor)
//                                        .padding()
//                                        .background(Theme.primaryGreen)
//                                        .clipShape(Circle())
//                                        .shadow(color: Theme.glowGreen.opacity(0.6), radius: 8)
//                                }
//                                .padding()
//                            }
//                        }
//                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    if user.accountType == "Premium" {
//                        Button { showNewPost = true } label: {
//                            Image(systemName: "plus")
//                                .font(.system(size: 14, weight: .bold))
//                                .foregroundColor(Theme.primaryGreen)
//                                .padding(9)
//                                .background(.ultraThinMaterial)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.4),lineWidth: 1))
//                        }
//                    }
//                }
//            }
        }
    }
}
/// Post Row
struct CommunityPostRow: View {
    
    let post: CommunityPost
    @Binding var selectedPost: CommunityPost?
    
    @State private var isButtonPressed = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            // Post Type Badge
            HStack {
                
                if post.type == .advertisement {
                    Text("SPONSORED")
                        .font(.caption2)
                        .bold()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(Theme.greenGradient.overlay(Theme.backColor.opacity(0.4)))
                        .foregroundColor(Theme.lightGreen)
                        .cornerRadius(6)
                }
                
                Text(post.type.rawValue)
                    .font(.caption)
                    .bold()
                
                //Positioning
                    .padding(6)
                
                //Color
                    .background(Color.white.opacity(0.85))
                    .foregroundColor(.black)
                    .cornerRadius(6)
                
                Spacer()
            }
            
            // Post Title & Description
            Text(post.title)
                .font(.headline)
                .foregroundColor(.black)
            Text(post.description)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(2)
            
            // Post Actions
            if post.type == .recipe {
                Button {
                    selectedPost = post
                } label: {
                    Text("View Full Recipe")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white) // text is white
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Theme.backColor.opacity(0.8)) // button background is backColor
                        .cornerRadius(12)
                        .shadow(color: Theme.glowGreen.opacity(isButtonPressed ? 0.8 : 0.4), radius: 6, x: 0, y: 3)
                        .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in isButtonPressed = true }
                        .onEnded { _ in isButtonPressed = false }
                )
            } else if post.type == .foodDrive {
                Button {
                    selectedPost = post
                } label: {
                    Text("Sign Up / Donate")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white) // text is white
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Theme.backColor.opacity(0.8)) // button background is backColor
                        .cornerRadius(12)
                        .shadow(color: Theme.glowGreen.opacity(isButtonPressed ? 0.8 : 0.4), radius: 6, x: 0, y: 3)
                        .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in isButtonPressed = true }
                        .onEnded { _ in isButtonPressed = false }
                )
            } else {
                Button {
                    selectedPost = post
                } label: {
                    Text("See Details")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white) // text is white
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Theme.backColor.opacity(0.8)) // button background is backColor
                        .cornerRadius(12)
                        .shadow(color: Theme.glowGreen.opacity(isButtonPressed ? 0.8 : 0.4), radius: 6, x: 0, y: 3)
                        .scaleEffect(isButtonPressed ? 0.95 : 1.0)
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in isButtonPressed = true }
                        .onEnded { _ in isButtonPressed = false }
                )
            }
            
        }
        .padding()
        .background(
            Theme.lightGreen
                .cornerRadius(16)
                .shadow(
                    color: post.type == .advertisement
                    ? Theme.primaryGreen.opacity(0.8)
                    : Theme.primaryGreen.opacity(0.4),
                    radius: post.type == .advertisement ? 18 : 12,
                    x: 0,
                    y: 0
                )
        )
        .padding(.horizontal)
    }
}


#Preview{
    CommunityBoardView()
}


