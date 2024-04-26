//
//  ChatService.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-23.
//

import Foundation
import Firebase

struct ChatService {
    
    let chatPartner : User
    
    func sendMessage(_ messageText: String) {
        
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let chatPartnerId = chatPartner.id
        
        let currentUserRef = FirebaseConstants.messagesCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = FirebaseConstants.messagesCollection.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentUserRef = FirebaseConstants.messagesCollection.document(currentUid).collection("recent_messages").document(chatPartnerId)
        let recentPartnerRef = FirebaseConstants.messagesCollection.document(chatPartnerId).collection("recent_messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageText: messageText,
            timeStamp: Timestamp()
        )
        
        guard let messageData = try? Firestore.Encoder().encode(message) else {return}
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)
    }
    
    func observeMessages(completion: @escaping ([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        print(chatPartnerId)
        let query = FirebaseConstants.messagesCollection
            .document(currentUid)
            .collection (chatPartnerId)
            .order(by: "timeStamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added }) else {return}
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = chatPartner
            }
            
            completion(messages)
        }
    }
}
