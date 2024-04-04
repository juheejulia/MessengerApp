//
//  ItemModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let body: String
    let isNewMessage: Bool
    
    init(id: String = UUID().uuidString, name: String, body: String, isNewMessage: Bool) {
        self.id = id
        self.name = name
        self.body = body
        self.isNewMessage = isNewMessage
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, name: name, body: body, isNewMessage: !isNewMessage)
    }
    
}
