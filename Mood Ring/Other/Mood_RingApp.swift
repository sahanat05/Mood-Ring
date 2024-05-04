//
//  Mood_RingApp.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import FirebaseCore
import SwiftUI

@main
struct Mood_RingApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
