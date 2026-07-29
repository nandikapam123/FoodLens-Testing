//
//  BackendTestView.swift
//  FoodLens
//

import SwiftUI

struct BackendTestView: View {
    @StateObject private var backendTest = BackendTest()
   
    var body: some View {
        VStack(spacing: 20) {
            Text("FoodLens Backend Test")
                .font(.title2)
           
            Text(backendTest.message)
                .multilineTextAlignment(.center)
           
            Button("Test Backend Connection") {
                backendTest.testConnection()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    BackendTestView()
}
