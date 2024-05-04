//
//  LoginView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import SwiftUI

// Adapted from iOS Academy Youtube tutorial videos
struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView()
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    MRButton(title: "Log In", background: Color(hex:"#FF73C5"), textColor: Color(hex:"#371F76")) {
                        viewModel.login()
                    }
                }
                .padding()
                
                
                //Create Account
                VStack {
                    Text("New to Mood Ring?")

                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "#D4DFFC"))
        }
        
    }
}

#Preview {
    LoginView()
}
