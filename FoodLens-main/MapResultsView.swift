import SwiftUI
import MapKit
import CoreLocation

enum PlaceFilter: String, CaseIterable, Identifiable {
    case all        = "All"
    case grocery    = "Grocery"
    case pantry     = "Pantry"
    case vegetarian = "Vegetarian"
    case vegan      = "Vegan"
    case halal      = "Halal"
    case kosher     = "Kosher"
    case glutenFree = "Gluten-Free"

    var id: String { rawValue }
    var isPremium: Bool { [.halal, .kosher, .glutenFree].contains(self) }
}

struct MapResultsView: View {

    @State var user: UserSession
    @State private var region: MKCoordinateRegion
    @State private var selectedFilter: PlaceFilter = .all
    @State private var selectedLocation: PantryLocation?

    let allLocations: [PantryLocation]

    init(center: CLLocationCoordinate2D, user: UserSession) {
        self.user = user
        self.allLocations = pantryLocations
        _region = State(initialValue: MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }


    var filteredLocations: [PantryLocation] {
        switch selectedFilter {
        case .all:        return allLocations.filter { isAccessible($0) }
        case .grocery:    return allLocations.filter { $0.type.lowercased() == "grocery" }
        case .pantry:     return allLocations.filter { $0.type.lowercased() == "pantry" }
        case .vegetarian: return allLocations.filter { $0.type.lowercased() == "vegetarian" }
        case .vegan:      return allLocations.filter { $0.type.lowercased() == "vegan" }
        case .halal:      return isPremium ? allLocations.filter { $0.type.lowercased() == "halal" } : []
        case .kosher:     return isPremium ? allLocations.filter { $0.type.lowercased() == "kosher" } : []
        case .glutenFree: return isPremium ? allLocations.filter { $0.type.lowercased() == "gluten-free" } : []
        }
    }

    private func isAccessible(_ location: PantryLocation) -> Bool {
        isPremium || !["halal", "kosher", "gluten-free"].contains(location.type.lowercased())
    }

    private var isPremium: Bool { user.accountType == "Premium" }


    private var nearby: [PantryLocation] {
        let center = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
        return allLocations.filter {
            CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
                .distance(from: center) < 3200
        }
    }

    private var groceryCount:    Int { nearby.filter { $0.type == "grocery" }.count }
    private var pantryCount:     Int { nearby.filter { $0.type == "pantry" }.count }
    private var restaurantCount: Int { nearby.filter { $0.type == "vegetarian" || $0.type == "vegan" }.count }

    private var accessIsGood: Bool { groceryCount >= 2 }
    private var accessMessage: String {
        if groceryCount == 0  { return "Limited grocery store access detected." }
        if groceryCount == 1  { return "Only one grocery store nearby. Access may be limited." }
        return "Multiple grocery stores available nearby."
    }


    var body: some View {
        ZStack(alignment: .bottom) {
            Theme.backColor
                .overlay(
                    LinearGradient(
                        colors: [Theme.primaryGreen.opacity(0.06), .clear, Theme.accentColor.opacity(0.06)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                header
                    .padding(.top, -15)
                mapView
                filterChips
                    
                insightCard
                    
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            
            if selectedLocation != nil {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { selectedLocation = nil } }
            }

            if let loc = selectedLocation {
                locationCard(loc)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            user.hideTabBar = true
        }
        .onDisappear {
            user.hideTabBar = false
        }
    }

    // MARK: - Subviews

    private var header: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Nearby Food")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(Theme.primaryGreen)
                .shadow(color: Theme.glowGreen.opacity(0.6), radius: 10)
            Text("Based on your ZIP code")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.45))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var insightCard: some View {
        DarkCard {
            VStack(alignment: .leading, spacing: 12) {
                Label("Food Access Insights", systemImage: "chart.bar.fill")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(Theme.primaryGreen)

                HStack(spacing: 10) {
                    statBox(value: groceryCount, label: "Grocery stores", color: .green)
                    statBox(value: pantryCount,  label: "Food pantries",  color: .orange)
                    statBox(value: restaurantCount, label: "Restaurants",  color: .purple)
                }

                HStack(spacing: 10) {
                    Circle()
                        .fill(accessIsGood ? Color.green : Color.orange)
                        .frame(width: 8, height: 8)
                    Text(accessMessage)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Theme.lightGreen.opacity(0.07))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Theme.lightGreen.opacity(0.18), lineWidth: 1)
                        )
                )
            }
        }
    }

    private func statBox(value: Int, label: String, color: Color) -> some View {
        VStack(spacing: 3) {
            Text("\(value)")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Theme.primaryGreen)
            Text(label)
                .font(.system(size: 9))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color.opacity(0.2), lineWidth: 1)
                )
        )
    }

    private var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(PlaceFilter.allCases) { filter in
                    if !filter.isPremium || isPremium {
                        filterChip(filter)
                    } else {
                        premiumChip(filter)
                    }
                }
            }
            .padding(.vertical, 2)
        }
    }

    private func filterChip(_ filter: PlaceFilter) -> some View {
        let isActive = selectedFilter == filter
        return Button {
            withAnimation(.easeInOut(duration: 0.2)) { selectedFilter = filter }
        } label: {
            Text(filter.rawValue)
                .font(.caption.weight(isActive ? .semibold : .regular))
                .foregroundColor(isActive ? Theme.backColor : .white.opacity(0.6))
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(
                    Capsule()
                        .fill(isActive ? Theme.primaryGreen.opacity(0.9) : Theme.lightGreen.opacity(0.08))
                        .overlay(Capsule().stroke(Theme.lightGreen.opacity(isActive ? 0 : 0.28), lineWidth: 1))
                )
        }
    }

    private func premiumChip(_ filter: PlaceFilter) -> some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.system(size: 9))
                .foregroundColor(.yellow.opacity(0.75))
            Text(filter.rawValue)
                .font(.caption)
                .foregroundColor(.yellow.opacity(0.65))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            Capsule()
                .fill(Color.yellow.opacity(0.06))
                .overlay(Capsule().stroke(Color.yellow.opacity(0.3), lineWidth: 1))
        )
    }

    private var mapView: some View {
        Map(coordinateRegion: $region, annotationItems: filteredLocations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Button {
                    withAnimation(.spring(response: 0.3)) { selectedLocation = location }
                } label: {
                    ZStack {
                        Circle()
                            .fill(color(for: location.type).opacity(0.25))
                            .frame(width: 44, height: 44)
                        Circle()
                            .fill(color(for: location.type))
                            .frame(width: 32, height: 32)
                        Image(systemName: icon(for: location.type))
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Theme.lightGreen.opacity(0.25), lineWidth: 1)
        )
        .frame(maxHeight: 400)
    }

//    private func locationCard(_ location: PantryLocation) -> some View {
//        DarkCard {
//            VStack(alignment: .leading, spacing: 10) {
//                HStack {
//                    VStack(alignment: .leading, spacing: 3) {
//                        Text(location.name)
//                            .font(.subheadline.weight(.semibold))
//                            .foregroundColor(.white.opacity(0.9))
//                        Text(location.type.capitalized)
//                            .font(.caption)
//                            .foregroundColor(color(for: location.type))
//                    }
//                    Spacer()
//                    Button {
//                        withAnimation { selectedLocation = nil }
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(.system(size: 11, weight: .bold))
//                            .foregroundColor(Theme.primaryGreen)
//                            .padding(8)
//                            .background(.ultraThinMaterial)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.3), lineWidth: 1))
//                    }
//                }
//
//                Divider().background(Theme.lightGreen.opacity(0.2))
//
//                detailRow(icon: "mappin.and.ellipse", text: location.address)
//                detailRow(icon: "clock",              text: location.hours)
//            }
//        }
//        .padding(.horizontal, 20)
//        .opacity(1.0)  // add this
//        .padding(.bottom, 20)
//        .transition(.move(edge: .bottom).combined(with: .opacity))
//    }
    
    private func locationCard(_ location: PantryLocation) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(location.name)
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(.white.opacity(0.9))
                    Text(location.type.capitalized)
                        .font(.caption)
                        .foregroundColor(color(for: location.type))
                }
                Spacer()
                Button {
                    withAnimation { selectedLocation = nil }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(Theme.primaryGreen)
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Theme.primaryGreen.opacity(0.3), lineWidth: 1))
                }
            }

            Divider().background(Theme.lightGreen.opacity(0.2))

            detailRow(icon: "mappin.and.ellipse", text: location.address)
            detailRow(icon: "clock",              text: location.hours)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.08, green: 0.10, blue: 0.09))  // very dark greenish-black
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Theme.lightGreen.opacity(0.25), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.6), radius: 20, x: 0, y: 8)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    private func detailRow(icon: String, text: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 13))
                .foregroundColor(Theme.primaryGreen.opacity(0.75))
                .frame(width: 18)
            Text(text)
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
        }
    }

    // MARK: - Helpers

    private func icon(for type: String) -> String {
        switch type {
        case "grocery":    return "cart.fill"
        case "pantry":     return "leaf.fill"
        case "vegetarian": return "leaf.circle.fill"
        case "vegan":      return "leaf.circle"
        case "halal":      return "staroflife.fill"
        case "kosher":     return "star.fill"
        case "gluten-free": return "drop.triangle.fill"
        default:           return "mappin"
        }
    }

    private func color(for type: String) -> Color {
        switch type {
        case "grocery":    return .green
        case "pantry":     return .orange
        case "vegetarian": return .purple
        case "vegan":      return .pink
        case "halal":      return .yellow
        case "kosher":     return .blue
        case "gluten-free": return .teal
        default:           return .gray
        }
    }
}


