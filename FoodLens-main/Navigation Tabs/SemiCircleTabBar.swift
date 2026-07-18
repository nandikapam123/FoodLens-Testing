//
//  SemiCircleTabbar.swift
//  FoodLens
//
//

import SwiftUI

struct SemiCircleTabBar: View {
    @Binding var selectedTab: TabViewEnum
    @State private var isExpanded: Bool = false
    var body: some View {
        Capsule()
            .fill(Color.black.opacity(0.5))
            .frame(width: isExpanded ? 220 : 70, height: isExpanded ? 220 : 70)
            .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
            .animation(.spring(), value: isExpanded)
        
        ZStack{
            let allTabs = TabViewEnum.allCases
            ForEach(allTabs.indices, id: \.self){index in
                let tab = allTabs[index]
                let angle = angleForTabButton(at: index, total: allTabs.count)
                
                let radius: CGFloat = 75
                
                Button{
                    withAnimation{
                        
                        selectedTab = tab
                        isExpanded.toggle()
                    }
                }label: {
                    Image(systemName: tab.tabItem.systemImage)
                        .font(.system(size: 15))
                        .padding(10)
                        .bold()
                        .foregroundStyle(.black)
                        .background(Theme.lightGreen, in: .circle)
                }
                .disabled(selectedTab == tab)
                .opacity(selectedTab == tab ? 0.6 : 1)
                .offset(
                    x: isExpanded ? radius * cos(angle.radians) : 0,
                    y: isExpanded ? radius * sin(angle.radians) : 0
                )
                .animation(.spring(), value: isExpanded)
            }
            
            Button{
                withAnimation{
                    isExpanded.toggle()
                }
            }label: {
                Image(systemName: selectedTab.tabItem.systemImage)
                    .font(.system(size: 26))
                    .padding()
                    .bold()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.black)
                    .background(Theme.greenGradient, in: .circle)
            }
            .shadow(color: Theme.glowGreen, radius: isExpanded ? 0 : 20, x: 0, y: 5)
        }
        
    }

    private func angleForTabButton(at Index: Int, total: Int) -> Angle {
        let totalArc: Double = 360
        
        let degreesPerItem = totalArc / Double(total)
        let startAngle: Double = -180
        
        let degrees = startAngle + (degreesPerItem * Double(Index))
        
        return .degrees(degrees)
    }
}


#Preview {
    @Previewable @State var selectedTab = TabViewEnum.contentView
    SemiCircleTabBar(selectedTab: $selectedTab)
}
