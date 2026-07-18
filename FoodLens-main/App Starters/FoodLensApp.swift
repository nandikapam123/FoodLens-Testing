//
//  FoodLensApp.swift
//

import SwiftUI
import SwiftData
@main
struct FoodLensApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State var user = UserSession()
    var body: some Scene {
        WindowGroup {
            Group{
                if isLoggedIn {
                    Start()
                } else {
                    SplashView()
                        .modelContainer(for: RecipeEntity.self)
                }
            }
            .environment(\.userSession, user)
        }
    }
}
