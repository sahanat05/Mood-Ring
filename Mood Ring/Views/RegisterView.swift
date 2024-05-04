//
//  RegisterView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import SwiftUI

// Adapted from iOS Academy Youtube tutorial videos

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView()
            
            // Login Form
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                TextField("Full Name", text:$viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text:$viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                MRButton(title: "Create Account", background: Color(hex:"#FF73C5"), textColor: Color(hex:"#371F76")) {
                    viewModel.register()
                }
            }
            .padding()
            .padding(.bottom, 100)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#D4DFFC"))
        
    }
}

#Preview {
    RegisterView()
}
