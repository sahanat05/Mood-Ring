//
//  ContentView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import SwiftUI

// Another extension sourced from iOS Academy's Youtube tutorials that allows for hex values to be used to determine color scheme
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        // Allows for the user to stay logged in even when app is not in use
        // All their info will be pulled up if they have already signed in
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // Signed in
            accountView
        } 
        else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        // Creates the navigation bar at bottom of phone screen
        TabView {
            MoodLogsView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MoodsDescribedView()
                .tabItem {
                    Label("Moods",
                systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            // Include other graphics here!!!
        }
    }
}

#Preview {
    MainView()
}
