//
//  MapView.swift
//

import SwiftUI
import MapKit
struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 30.2672,
            longitude: -97.7431
        ),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Map(coordinateRegion: $region)
                    .cornerRadius(16)
                    .padding()
                
                Text("Discover healthy food locations near you.")
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .navigationTitle("Map")
        }
    }
}

#Preview{
    MapView()
}


