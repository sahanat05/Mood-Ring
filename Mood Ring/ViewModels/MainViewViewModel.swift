//
//  MainViewViewModel.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import FirebaseAuth
import Foundation

// Adapted from iOS Academy Youtube Tutorial to ensure user is signed in
class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    // Uses Firebase's function to determine if the user is signed in or not
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
