//
//  ChatListViewViewModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation
import Combine
import Firebase

class ChatListViewModel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private let service = InboxService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscibers()
        service.observeRecentMessages()
        
    }
    
    private func setupSubscibers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        
        var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
        
        
        
        
        for i in 0 ..< messages.count {
            
            let recentMessage = messages[i]
            
            UserService.fetchUser(withUid: recentMessage.chatPartnerId) { user in
                messages[i].user = user
                if self.recentMessages.contains(where: {$0.chatPartnerId == messages[i].chatPartnerId}) {
                    guard let index = self.recentMessages.firstIndex(where: {$0.chatPartnerId == messages[i].chatPartnerId}) else {return}
                    self.recentMessages.remove(at: index)
                }
                self.recentMessages.append(messages[i])
                self.recentMessages.sort(by: {$0.timeStamp.dateValue() > $1.timeStamp.dateValue()})
                
            }
        }
    }
    
    private func filterArray(messages: [Message]){
        var dublicatesId : [String] = []
        var checkMessage = messages.first
        for message in messages {
            if message == checkMessage {
                dublicatesId.append(checkMessage!.chatPartnerId)
                checkMessage = message
            } else {
                checkMessage = message
            }
        }
        
        
    }
}
