//
//  Start.swift
//  FoodLens
//

import SwiftUI

struct Start: View {
    @Environment(\.userSession) var user
    @State var isPresented = false
    var body: some View {
        TabView(selection: Binding(
            get: { user.selectedTab },
            set: { user.selectedTab = $0 })){
            ForEach(TabViewEnum.allCases){ tab in
                Tab(
                    tab.tabItem.name,
                    systemImage: tab.tabItem.systemImage,
                    value: tab){
                        tab
                            .toolbarVisibility(.hidden, for: .tabBar)
                            .background{
                                if !isPresented{
                                    RemoveMoreButton{
                                        isPresented = true
                                    }
                                }
                                        
                            }
                    }

            }
        }
        .onAppear {
            print("Selected tab on appear:", user.selectedTab)
        }
        .safeAreaInset(edge: .bottom){
//            CustomTabBar(selectedTab: Binding(
//                get: { user.selectedTab },
//                set: { user.selectedTab = $0 }
//            ))
//            .background(Theme.backColor.opacity(0.5))
//            .padding(-1)
//            .cornerRadius(200)
            
            if !user.hideTabBar {
                SemiCircleTabBar(selectedTab: Binding(
                    get: { user.selectedTab },
                    set: { user.selectedTab = $0 }
                ))
                .padding(.bottom, -20)
            }
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    Start()
}


