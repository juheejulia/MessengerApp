//
//  InboxService.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-23.
//

import SwiftUI
import Firebase

class InboxService {
    
    static let shared = InboxService()
    
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let query = FirebaseConstants.messagesCollection.document(uid).collection("recent_messages").order(by: "timeStamp",descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added || $0.type == .modified}) else {return}
            
            self.documentChanges = changes
        }
    }
    
   
}
