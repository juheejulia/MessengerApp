//
//  Message.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-15.
//

import Foundation

struct Message {
    
    let userUID: String
    let text: String
    let photoUrl: String
    let createdAt: Date
    
    func isFromCurrentUser() -> Bool {
        return true
    }
    
}
