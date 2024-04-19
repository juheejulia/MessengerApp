//
//  Message.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-15.
//

import Foundation

struct Message: Identifiable, Codable {
    
    let id: String
    let text: String
    //let photoUrl: String
    let createdAt: Date
    let received: Bool
    
    
    func isFromCurrentUser() -> Bool {
        return true
    }
}
