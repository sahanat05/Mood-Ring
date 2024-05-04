//
//  MoodsDescribedView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 5/3/24.
//

import SwiftUI

struct MoodsDescribedView: View {
    // Bringing in this viewModel because it has access to the moods_dictionary
    @StateObject var viewModel = NewLogViewViewModel()
    
    var body: some View {

        VStack {
            // Uses for loop to iterate through the dictionary of moods
            // Lists out all of the moods and which color they fall under
            ForEach(viewModel.moods_dictionary.keys.sorted(), id: \.self) { key in if let moodArray = viewModel.moods_dictionary[key] as? [String] {
                        ZStack {
                            Capsule()
                                .foregroundColor(Color(hex: key))
                                .frame(width: 350, height: 90)
                            
                            VStack {
                                ForEach(moodArray, id: \.self) { mood in
                                Text("\(mood)")
                                        .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MoodsDescribedView()
}
