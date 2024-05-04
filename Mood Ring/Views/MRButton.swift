//
//  MRButton.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/24/24.
//

import SwiftUI

// Creates a standardized button that follows the app's color theme and can be used for various actions throughout the app
struct MRButton: View {
    let title: String
    let background: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
            Text(title)
                    .foregroundColor(textColor)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        MRButton(title: "Value", background: Color(hex:"#FF73C5"), textColor: Color(hex:"#371F76")) {
            //Action
        }
        
    }
}
