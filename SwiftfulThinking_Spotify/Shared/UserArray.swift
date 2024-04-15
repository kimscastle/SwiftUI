//
//  UserArray.swift
//  SwiftfulThinking_Spotify
//
//  Created by uiskim on 4/3/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    var work: String {
        "Worker as Some Job"
    }
    
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile"
    }
    
    var images: [String] {
        [
            "https://picsum.photos/500/500",
            "https://picsum.photos/600/600",
            "https://picsum.photos/700/700"
        ]
    }
    
    static var mock: User {
        return .init(
            id: 444,
            firstName: "Nick",
            lastName: "Sarno",
            age: 27,
            email: "hi@hi.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 55
        )
    }
}
