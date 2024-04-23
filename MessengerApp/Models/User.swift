//
//  User.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    
    @DocumentID var uid: String?
    
    let username: String
    let email: String
    var profileImageUrl: String?
    
    var id : String {
        return uid ?? UUID().uuidString
    }
}

extension User {
    static let MOCK_USER = User(username: "Bruce Wane", email: "Abcd@email.com", profileImageUrl: "batman")
}
