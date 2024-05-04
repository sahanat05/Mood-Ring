//
//  ProfileView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import SwiftUI

// Contains all of the information presented on the Profile Tab
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                // Grabs the user's info from the view model
                if let user = viewModel.user {
                    // Cute Avatar to show profile
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(hex:"#0B5394"))
                        .frame(width: 125, height: 125)
                    
                    //Provides Name, Email, and membership info to display for user's convenience
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    
                    // Sign out
                    MRButton(title: "Log Out", background: Color(hex:"#FF73C5"), textColor: Color(hex:"#371F76")) {
                        viewModel.logOut()
                    }
                    .padding()
                    .frame(width: 125, height: 75)
                } 
                // In the case where the user could not be found, the following will be displayed instead
                else {
                    Text("Loading Profile...")
                }
            }
        }
        // Prompts the computer to find the user when the Profile tab is clicked
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
