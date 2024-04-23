//
//  ChatWindowViewModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation

class ChatWindowViewModel: ObservableObject {
    @Published var messageText: String = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    
    
    func observeMessages(){
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
        messageText = ""
    }
    
    func checkIfUserHasInternet() -> Bool{
        return true
    }
}
