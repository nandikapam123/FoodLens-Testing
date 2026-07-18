//
//  FindView.swift
//  FoodLens
//

import SwiftUI
import CoreLocation

struct FindView: View {

    @Environment(\.userSession) var user

    @State private var zipCode: String = ""
    @State private var showMap = false
    @State private var coordinates: CLLocationCoordinate2D?
    @State private var isButtonPressed = false
    @State private var selectedFilter: FilterType = .all

    @FocusState private var zipFocused: Bool

    enum FilterType: String, CaseIterable {
        case all         = "All"
        case grocery     = "Grocery"
        case pantry      = "Pantries"
        case plantBased  = "Plant-Based"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.backColor
                    .overlay(
                        LinearGradient(
                            colors: [
                                Theme.primaryGreen.opacity(0.06),
                                .clear,
                                Theme.accentColor.opacity(0.06)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        header
                            .padding(.top, 10)
                        zipField
                            .padding()
                            .padding(.bottom, -30)
                            .padding(.top, -10)
                        
                        showMapButton
                            .padding()
                            .padding(.bottom, -20)

                        legendCards
                            .padding()
                            .padding(.bottom, -35)
                        
                    }
                    .padding(.bottom, 50)
                }
            }
            .navigationDestination(isPresented: $showMap) {
                if let coordinates = coordinates {
                    MapResultsView(center: coordinates, user: user)
                }
            }
        }
    }

    // MARK: - Subviews

    private var header: some View {
        PageHeader(title: "Find Food", subtitle: "Nearby grocery stores, pantries & plant-based options. Enter your ZIP code above to discover nearby food options on the map.")
    }

    private var zipField: some View {
        HStack(spacing: 12) {
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 14))
                .foregroundColor(Theme.primaryGreen.opacity(0.8))
                .frame(width: 20)

            TextField("Enter ZIP code…", text: $zipCode)
                .font(.subheadline)
                .foregroundColor(.white)
                .tint(Theme.primaryGreen)
                .keyboardType(.numberPad)
                .focused($zipFocused)
        }
        .padding(14)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 16).fill(Color.black.opacity(0.28))
                RoundedRectangle(cornerRadius: 16).fill(Theme.lightGreen.opacity(0.10))
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        zipFocused
                            ? Theme.primaryGreen.opacity(0.8)
                            : Theme.lightGreen.opacity(0.35),
                        lineWidth: zipFocused ? 1.5 : 1
                    )
            }
        )
        .shadow(color: zipFocused ? Theme.glowGreen.opacity(0.4) : .clear, radius: 10)
        .animation(.easeInOut(duration: 0.2), value: zipFocused)
    }

    private var filterSegment: some View {
        HStack(spacing: 0) {
            ForEach(FilterType.allCases, id: \.self) { type in
                let isSelected = selectedFilter == type
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedFilter = type
                    }
                } label: {
                    Text(type.rawValue)
                        .font(.caption.weight(isSelected ? .semibold : .regular))
                        .foregroundColor(isSelected ? Theme.backColor : .white.opacity(0.55))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 9)
                        .background(
                            isSelected
                                ? Theme.primaryGreen.opacity(0.9)
                                : Color.clear
                        )
                        .cornerRadius(10)
                }
            }
        }
        .padding(4)
        .background(Theme.lightGreen.opacity(0.10))
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Theme.lightGreen.opacity(0.3), lineWidth: 1)
        )
    }

    private var legendCards: some View {
        VStack(spacing: 14) {
            // Grocery / Pantry
            DarkCard {
                VStack(alignment: .leading, spacing: 0) {
                    Label("Grocery / Pantry", systemImage: "cart.circle.fill")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.primaryGreen)
                        .padding(.bottom, 12)

                    legendRow(
                        icon: "cart.circle.fill",
                        iconColor: .green,
                        title: "Grocery Stores",
                        subtitle: "Full-service food retail"
                    )

                    Divider().background(Theme.lightGreen.opacity(0.15)).padding(.vertical, 8)

                    legendRow(
                        icon: "leaf.fill",
                        iconColor: .orange,
                        title: "Food Pantries",
                        subtitle: "Free community food access"
                    )
                }
            }

            // Restaurants / Specialty
            DarkCard {
                VStack(alignment: .leading, spacing: 0) {
                    Label("Restaurants / Specialty", systemImage: "fork.knife.circle.fill")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.primaryGreen)
                        .padding(.bottom, 12)

                    legendRow(
                        icon: "leaf.circle.fill",
                        iconColor: .purple,
                        title: "Vegetarian",
                        subtitle: "Plant-forward menus"
                    )

                    Divider().background(Theme.lightGreen.opacity(0.15)).padding(.vertical, 8)

                    legendRow(
                        icon: "leaf.circle",
                        iconColor: .pink,
                        title: "Vegan",
                        subtitle: "100% animal-free options"
                    )
                }
            }
        }
    }

    private func legendRow(icon: String, iconColor: Color, title: String, subtitle: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(iconColor.opacity(0.15))
                    .frame(width: 36, height: 36)
                Image(systemName: icon)
                    .font(.system(size: 15))
                    .foregroundStyle(iconColor)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.38))
            }
        }
    }

    private var showMapButton: some View {
        Button {
            Task {
                coordinates = await geocode(zipCode: "\(zipCode), USA")
                if coordinates != nil { showMap = true }
                    
            }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "map.fill")
                Text("Show on Map")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                isValidZip
                    ? LinearGradient(
                        colors: [Theme.primaryGreen, Theme.accentColor],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                      )
                    : LinearGradient(
                        colors: [Theme.lightGreen.opacity(0.3), Theme.lightGreen.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                      )
            )
            .foregroundColor(isValidZip ? Theme.backColor : .white.opacity(0.4))
            .cornerRadius(16)
            .shadow(color: isValidZip ? Theme.glowGreen.opacity(0.5) : .clear, radius: 12)
            .scaleEffect(isButtonPressed ? 0.97 : 1.0)
        }
        .disabled(!isValidZip)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isButtonPressed = true }
                .onEnded   { _ in isButtonPressed = false }
        )
        .animation(.easeInOut(duration: 0.2), value: isValidZip)
    }

    private var tipBanner: some View {
        Text("Enter your ZIP code above to discover nearby food options on the map.")
            .font(.footnote)
            .foregroundColor(.white.opacity(0.55))
            .multilineTextAlignment(.center)
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Theme.lightGreen.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Theme.lightGreen.opacity(0.2), lineWidth: 1)
                    )
            )
    }


    private var isValidZip: Bool { zipCode.count == 5 }

    func geocode(zipCode: String) async -> CLLocationCoordinate2D? {
        let geocoder = CLGeocoder()
        do {
            let placemarks = try await geocoder.geocodeAddressString(zipCode)
            return placemarks.first?.location?.coordinate
        } catch {
            print("Geocoding failed:", error)
            return nil
        }
    }
}


// OLD MAP VIEW
//import SwiftUI
//import CoreLocation
//struct FindView: View {
//    
//    @Environment(\.userSession) var user
//    
//    @State private var zipCode: String = ""
//    @State private var showMap = false
//    @State private var coordinates: CLLocationCoordinate2D?
//    @State private var isButtonPressed = false
//    
//    @FocusState private var focusedField: String?
//    
//    var body: some View {
//        NavigationStack {
//            ZStack{
//                Theme.backColor.ignoresSafeArea()
//                
//                ScrollView{
//                    VStack(spacing: 24) {
//                        
//                        PageHeader(
//                            title: "Find Food",
//                            subtitle: "Nearby grocery stores, pantries & plant-based options."
//                        )
//                        
//                        TextField("Enter ZIP Code", text: $zipCode)
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .fill(Theme.lightGreen.opacity(0.15))
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 16)
//                                            .stroke(
//                                                focusedField == "zipCode"
//                                                ? Theme.primaryGreen
//                                                : Theme.primaryGreen.opacity(0.3),
//                                                lineWidth: 2
//                                            )
//                                    )
//                                    .shadow(
//                                        color: focusedField == "zipCode"
//                                        ? Theme.primaryGreen.opacity(0.8)
//                                        : .clear,
//                                        radius: 10
//                                    )
//                            )
//                            .foregroundColor(Theme.lightGreen)
//                            .tint(Theme.primaryGreen)
//                            .focused($focusedField, equals: "zipCode")
//                            .padding(.horizontal)
//                        
//                        // MARK: Show Map Button
//                        Button {
//                            Task {
//                                coordinates = await geocode(zipCode: "\(zipCode), USA")
//                                if coordinates != nil { showMap = true }
//                            }
//                        } label: {
//                            Text("Show on Map")
//                                .font(.custom("Verdana", size: 20))
//                                .frame(maxWidth: .infinity)
//                                .padding()
//                                .bold()
//                                .foregroundColor(Theme.backColor)
//                                .background(
//                                    LinearGradient(
//                                        colors: [Theme.primaryGreen, Theme.accentColor],
//                                        startPoint: .topLeading,
//                                        endPoint: .bottomTrailing
//                                    )
//                                    .cornerRadius(14)
//                                    .shadow(color: Theme.glowGreen.opacity(isButtonPressed ? 0.8 : 0.5), radius: 12, x: 0, y: 4)
//                                )
//                                .scaleEffect(isButtonPressed ? 0.95 : 1.0)
//                        }
//                        .padding(.horizontal)
//                        .simultaneousGesture(
//                            DragGesture(minimumDistance: 0)
//                                .onChanged { _ in isButtonPressed = true }
//                                .onEnded { _ in isButtonPressed = false }
//                        )
//                        .disabled(zipCode.count != 5)
//                        .opacity(zipCode.count != 5 ? 0.3 : 1)
//                        
//                        // MARK: Legend Boxes
//                        VStack(spacing: 16) {
//                            
//                            // Grocery Box
//                            VStack(alignment: .leading, spacing: 12) {
//                                Text("Grocery / Pantry")
//                                    .font(.custom("Verdana-Bold", size: 18))
//                                    .foregroundColor(Theme.backColor)
//                                
//                                HStack(spacing: 16) {
//                                    Image(systemName: "cart.circle.fill")
//                                        .foregroundStyle(.green)
//                                    Text("Grocery Stores")
//                                        .font(.custom("Verdana", size: 16))
//                                    
//                                    Image(systemName: "leaf.fill")
//                                        .foregroundStyle(.orange)
//                                    Text("Food Pantries")
//                                        .font(.custom("Verdana", size: 16))
//                                    
//                                    Spacer()
//                                }
//                            }
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Theme.lightGreen)
//                            .cornerRadius(20)
//                            .shadow(color: Theme.glowGreen.opacity(0.3), radius: 8, x: 0, y: 4)
//                            
//                            // Restaurants / Specialty Box
//                            VStack(alignment: .leading, spacing: 12) {
//                                Text("Restaurants / Specialty")
//                                    .font(.custom("Verdana-Bold", size: 18))
//                                    .foregroundColor(Theme.backColor)
//                                
//                                HStack(spacing: 16) {
//                                    Image(systemName: "leaf.circle.fill")
//                                        .foregroundStyle(.purple)
//                                    Text("Vegetarian")
//                                        .font(.custom("Verdana", size: 16))
//                                    
//                                    Image(systemName: "leaf.circle")
//                                        .foregroundStyle(.pink)
//                                    Text("Vegan")
//                                        .font(.custom("Verdana", size: 16))
//                                    
//                                    Spacer()
//                                }
//                            }
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Theme.lightGreen)
//                            .cornerRadius(20)
//                            .shadow(color: Theme.glowGreen.opacity(0.3), radius: 8, x: 0, y: 4)
//                            
//                        }
//                        .padding(.horizontal)
//                        
//                        
//                        Spacer()
//                        
//                        Text("Use the button above to view nearby options based on your ZIP code!")
//                            .font(.custom("Verdana", size: 15))
//                            .foregroundColor(.white.opacity(0.9))
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(
//                                RoundedRectangle(cornerRadius: 14)
//                                    .fill(Theme.lightGreen.opacity(0.25))
//                                    .shadow(color: Theme.glowGreen.opacity(0.25), radius: 5, x: 0, y: 2)
//                            )
//                            .padding(.horizontal)
//                            .multilineTextAlignment(.center)
//                        
//                        Spacer()
//                    }
//                    .padding(.vertical)
//                    .navigationTitle("")
//                    .navigationDestination(isPresented: $showMap) {
//                        if let coordinates = coordinates {
//                            MapResultsView(center: coordinates, user: user)
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    // MARK: - ZIP → Coordinates
//    func geocode(zipCode: String) async -> CLLocationCoordinate2D? {
//        let geocoder = CLGeocoder()
//        do {
//            let placemarks = try await geocoder.geocodeAddressString(zipCode)
//            return placemarks.first?.location?.coordinate
//        } catch {
//            print("Geocoding failed:", error)
//            return nil
//        }
//    }
//}

//  FindView.swift  —  redesigned to match NewCommunityPostView style


#Preview{
    FindView()
}
