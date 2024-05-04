//
//  MoodLogItem.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import Foundation

// Each mood log item is also store in the Firebase database

struct MoodLogItem: Codable, Identifiable {
    let id: String
    let mood: String
    let color: String
    let todayDate: TimeInterval

}
