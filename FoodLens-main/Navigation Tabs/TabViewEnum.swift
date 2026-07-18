//
//  TabViewEnum.swift
//
import Foundation
import SwiftUI
import SwiftData

enum TabViewEnum: Identifiable, CaseIterable, View, Hashable{
    case contentView, scannerView, findView, mealSuggestions, communityBoard, profile

    var id: Self { self }
    
    var tabItem: TabItem{
        switch self {
        case .scannerView:
                .init(name: "Scanner", systemImage: "barcode.viewfinder", color: Theme.lightGreen)
        case .findView:
                .init(name: "Find Food", systemImage: "map.fill", color: Theme.lightGreen)
        case .mealSuggestions:
                .init(name: "Meals", systemImage: "fork.knife", color: Theme.lightGreen)
        case .communityBoard:
                .init(name: "Community", systemImage: "person.3.fill", color: Theme.lightGreen)
        case .profile:
                .init(name: "Profile", systemImage: "person.fill", color: Theme.lightGreen)
        case .contentView:
                .init(name: "Home", systemImage: "house.fill", color: Theme.lightGreen)
        }
    }
    
    var body: some View {
        switch self {
        case .scannerView:
            ScannerView()
              
        case .findView:
            FindView()
             
        case .mealSuggestions:
            MealSuggestionsViewWrapper()
       
        case .communityBoard:
            CommunityBoardView()
            
        case .profile:
            ProfileView()
            
        case .contentView:
            ContentView()
   
        }
    }
}

