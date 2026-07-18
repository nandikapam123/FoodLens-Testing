//
//  UserSession.swift
//

import SwiftUI
import Combine

@Observable
class UserSession{
    
    var name: String {
            get {
                UserDefaults.standard.string(forKey: "name") ?? ""
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "name")
            }
        }
    
    var username: String{
        get{
            UserDefaults.standard.string(forKey: "username") ?? ""
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "username")
        }
    }
    
    var preferences: String {
        get{
            UserDefaults.standard.string(forKey: "preferences") ?? ""
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "preferences")
        }
        
    }

    var accountType: String {
        get{
            UserDefaults.standard.string(forKey: "accountType") ?? "Basic"
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey: "accountType")
        }
    }
    
    var scanHistory: [(date: Date, category: IngredientCategory, matches: [String])] = []
    var selectedTab: TabViewEnum = .contentView
    
    // AddScan safely on main thread
    func addScan(category: IngredientCategory, matches: [String]) {
        DispatchQueue.main.async {
            self.scanHistory.append((date: Date(), category: category, matches: matches))
        }
    }
    var hideTabBar: Bool = false
}



struct UserSessionKey: EnvironmentKey{
    static let defaultValue = UserSession()
}

extension EnvironmentValues{
    var userSession: UserSession{
        get{
            self[UserSessionKey.self]
        }set{
            self[UserSessionKey.self] = newValue
        }
    }
}
