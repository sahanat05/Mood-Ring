//
//  extensions.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/24/24.
//

import Foundation

// Sourced from iOS Academy Tutorial on YouTube to help maintain database with dictionary
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
