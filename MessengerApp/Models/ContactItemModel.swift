//
//  ContactItemModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation

struct ContactItemModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let phoneNumber: String
    let avatar: String
    // Need to know and fix how to upload pictures
    
    init(id: String = UUID().uuidString, name: String, phoneNumber: String, avatar: String) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.avatar = avatar
    }
    
    func updateCompletion() -> ContactItemModel {
        return ContactItemModel(id: id, name: name, phoneNumber: phoneNumber, avatar: avatar)
    }
}
