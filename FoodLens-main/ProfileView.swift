//
//  ProfileView.swift
//

import SwiftUI
struct ProfileView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @Environment(\.userSession) var user
    
    @State private var showPreferencesEditor = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Theme.backColor.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        Spacer()
                        
                        // Navigation Header as Text Box
                        Text("Profile")
                            .font(.largeTitle.bold())
                            .foregroundColor(Theme.primaryGreen)
                            .shadow(color: Theme.glowGreen.opacity(0.5), radius: 8)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Theme.lightGreen.opacity(0.2))
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .padding(.top, -40)
                        
                        // 1. Profile Header
                        VStack(spacing: 8) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Theme.lightGreen)
                                .background(Circle().fill(.white.opacity(0.1)))
                            
                            Text(user.name)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                            
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .foregroundColor(Theme.lightGreen.opacity(0.8))
                        }
                        .padding(.top, 20)
                        
                        // 2. Info Card
                        VStack(spacing: 0) {
                            // Preferences Row (now tappable)
                            Button {
                                showPreferencesEditor = true
                            } label: {
                                InfoRow(icon: "fork.knife", label: "Preferences", value: user.preferences)
                            }
                            
                            Divider().background(.white.opacity(0.2)).padding(.horizontal)
                            
                            HStack {
                                Label("Account Status", systemImage: "star.fill")
                                    .foregroundColor(.white)
                                Spacer()
                                Text(user.accountType)
                                    .font(.caption.bold())
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Theme.primaryGreen)
                                    .foregroundColor(Theme.backColor)
                                    .cornerRadius(20)
                            }
                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.08)))
                        .padding(.horizontal)
                        
                        // 3. Scan History
                        VStack(alignment: .leading, spacing: 15) {
                            Label("Scan History", systemImage: "clock.arrow.circlepath")
                                .font(.headline)
                                .foregroundColor(Theme.backColor)
                            
                            if user.scanHistory.isEmpty {
                                Text("No scans yet...")
                                    .foregroundColor(Theme.backColor)
                            } else {
                                ForEach(user.scanHistory.indices, id: \.self) { i in
                                    let scan = user.scanHistory[i]
                                    Text("\(scan.date.formatted(.dateTime.hour().minute())) - \(scan.category.rawValue.capitalized): \(scan.matches.joined(separator: ", "))")
                                        .font(.subheadline)
                                        .foregroundColor(Theme.backColor)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Theme.lightGreen)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        // 4. Logout Button
                        Button(role: .destructive) {
                            isLoggedIn = false
                            
                            
                        } label: {
                            Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                                .bold()
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 16).stroke(Color.red, lineWidth: 1))
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("")
            .sheet(isPresented: $showPreferencesEditor) {
                PreferencesEditorView(user: user)
            }
        }
    }
}
struct InfoRow: View {
    var icon: String
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: icon)
                .foregroundColor(.white)
            Spacer()
            Text(value.isEmpty ? "None" : value)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
    }
}
// MARK: - Example Preferences Editor
struct PreferencesEditorView: View {
    @State var user: UserSession
    @Environment(\.dismiss) var dismiss
    @State private var tempPreferences: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Edit Preferences")
                    .font(.title2.bold())
                    .padding(.top)
                
                TextField("Enter preferences", text: $tempPreferences)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onAppear {
                        tempPreferences = user.preferences
                    }
                
                Button("Save") {
                    user.preferences = tempPreferences
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.backColor)
                .foregroundColor(.white)
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
            
            // Back button in navigation bar
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Back", systemImage: "chevron.left")
                    }
                }
            }
        }
    }
}

#Preview{
    ProfileView(
        isLoggedIn: false
    )
}

