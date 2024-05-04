//
//  NewLogViewViewModel.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewLogViewViewModel: ObservableObject {
    @Published var selectedMood = "Energized"
    
    // Main dictionary that establishes all moods and colors they are associated with
    let moods_dictionary: [String: (Any)] = [
        "#34A855": ["Energized", "Amused", "Fresh"],
        "#FCE205": ["Nervous", "Unsettled", "Distracted"],
        "#FF781F": ["Irritated", "Impatient"],
        "#FF3C00": ["Angry", "Disturbed"],
        "#7F00FF": ["Satisfied", "Balanced"],
        "#3A9BDC": ["Calm", "Loving", "Honest", "Emotional"],
        "#000000": ["Stressed", "Overworked", "Tired"],
    ]
    
    init() {}
    
    func save() {
        
        // Get current user
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Obtains the color based on the selected mood using the dictionary
        let selectedColor = moods_dictionary.first { _, value in
            if let moodArray = value as? [String] {
                return moodArray.contains(selectedMood)
            }
            return false
        }?.key ?? ""
        
        // DateAdded will be used as the main id in this moodlogs collection
        let dateAdded = Date().timeIntervalSince1970
        
        // We don't need to generate an id for these mood logs
        // The id will be the date in which they were created
        // This makes it much much easier to parse through the data for graphical analytics in MoodLogsView 
        let newLog = MoodLogItem(id: String(dateAdded), mood: selectedMood, color: selectedColor, todayDate: dateAdded)
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("moodlogs")
            .document(String(dateAdded))
            .setData(newLog.asDictionary())
        
    }
    
}
