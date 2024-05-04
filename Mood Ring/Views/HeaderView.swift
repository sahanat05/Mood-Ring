//
//  HeaderView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/24/24.
//

import SwiftUI

// Abstracted style for the header block that has the logo and says "Activate Infinity Mood)
// This is used on the Login, Create Account, Home, and Profile Views

struct HeaderView: View {
    var body: some View {
        VStack() {
            Image("MoodRingLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 120)
            
            Text("Activate Infinity Mood")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(Color(hex: "#371F76"))
        }
        .frame(maxWidth: 350, alignment: .center)
        .background(Color(hex: "#D4DFFC"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.bottom, 20)
    }
}

#Preview {
    HeaderView()
}
