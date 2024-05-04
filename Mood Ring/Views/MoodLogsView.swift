//
//  MoodLogsView.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import FirebaseFirestoreSwift

import SwiftUI

struct MoodLogsView: View {
    @StateObject var viewModel = MoodLogsViewViewModel()
    @FirestoreQuery var logs: [MoodLogItem]

    // Ensures that the logs variable is dynamically updated as new mood logs are added. 
    // This way the page will accordingly change the most recent mood
    init(userId: String) {
        self._logs = FirestoreQuery(collectionPath: "users/\(userId)/moodlogs")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                // Mood Board is the most recent 5 moods that you've been feeling
                // Circles are meant to represent "mood rings"
                Text("Your Mood Board")
                    .font(.title)
                Text("Check out the Moods page to learn what the colors represent!")
                    .multilineTextAlignment(.center)
                // Parses through the final five additions to the collection to display their colors
                HStack {
                    ForEach(logs.suffix(5), id: \.id) {
                        moodLogItem in
                        Circle()
                            .frame(width: 50)
                            // Color the circle using the mood log's allocated color from the database
                            .foregroundColor(Color(hex: moodLogItem.color))
                    }
                }
                .padding(.bottom, 20)
                
                Text("Your Most Recent Mood")
                    .font(.title)
                
                // Obtains the most recent mood and presents it in an oval shape with the mood felt written as text within it.
                ZStack {
                    if let lastLog = logs.last {
                        let lastLogColor = lastLog.color
                        let lastLogMood = lastLog.mood
                        
                        // Larger shape is used to highlight most recent mood for user's convenience
                        Capsule()
                            // Color the capsule in the color of the mood
                            .foregroundColor(Color(hex: lastLogColor))
                            .frame(width: 350, height: 200)
                        
                        VStack {
                            Text(lastLogMood)
                                .foregroundColor(.white)
                                .font(.title)
                        }

                    }
                }

            }
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewLogItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewLogItemView) {
                NewLogView(newLogPresented: $viewModel.showingNewLogItemView)
            }
        }
    }
}

#Preview {
    MoodLogsView(userId: "")
}
