//
//  NewLogView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import SwiftUI

// Behind the scenes need to log the date that it's happening on

struct NewLogView: View {
    @StateObject var viewModel = NewLogViewViewModel()
    
    @Binding var newLogPresented: Bool
    
    var body: some View {
        // Formats the pop-up form that appears when the plus button is pressed
        VStack {
            Text("New Mood Log")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Form {
                // Title
                Picker("How are you feeling?", selection: $viewModel.selectedMood) {
                    ForEach(viewModel.moods_dictionary.keys.sorted(), id: \.self) { key in
                        if let moodArray = viewModel.moods_dictionary[key] as? [String] {
                            ForEach(moodArray, id: \.self) { mood in
                                Text("\(mood)")
                            }
                        }
                    }
                }
                
                // Save
                MRButton(title: "Save", background: Color(hex:"#FF73C5"), textColor: Color(hex:"#371F76")) {
                    viewModel.save()
                    newLogPresented = false
                }
                .pickerStyle(.menu)
                .padding()
                
            }
        }
    }
}

#Preview {
    NewLogView(newLogPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
