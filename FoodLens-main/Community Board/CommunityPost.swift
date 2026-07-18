//
//  CommunityPost.swift
//

import SwiftUI
// Post Type
enum CommunityPostType: String {
    case recipe = "Recipe"
    case foodDrive = "Food Drive"
    case advertisement = "Store Promotion"
}
// Community Post Model
struct CommunityPost: Identifiable {
    let id = UUID()
    let type: CommunityPostType
    let title: String
    let description: String
    let contactInfo: String
    let image: UIImage?
    let ingredients: [String]?
    let steps: [String]?
    let volunteerDetails: String
    let driveLocation: String
    let missionDescription: String
    let storeLocation: String
    let discountDetails: String
    let postedByPremium: Bool
}





