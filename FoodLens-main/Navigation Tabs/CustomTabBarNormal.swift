//
//  CustomTabBar.swift
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabViewEnum
    var body: some View {
        
        ZStack{
            HStack{
                ForEach(TabViewEnum.allCases){tab in
                    Button{
                        withAnimation{
                            selectedTab = tab
                        }
                    }label: {
                        Image(systemName: tab.tabItem.systemImage)
                            .font(.system(size: 18))
                            .padding(10)
                            .bold()
                            .foregroundStyle(.black)
                            .background(tab == selectedTab ? Theme.glowGreen : Theme.lightGreen, in: .circle)
                    }
                    .disabled(selectedTab == tab)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.contentView
    CustomTabBar(selectedTab: $selectedTab)
}
