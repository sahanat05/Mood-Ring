//
//  ProfileViewViewModel.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    // Used in ProfileView to obtain user's information when the profile is viewed
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    // Pre-existing function in Firebase that logs out the user
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            // Error will likely not happen ever because of all the other error handling mechanisms set in place in Login and Create Account Views
            // Added just for safety
            print(error)
        }
    }
}
