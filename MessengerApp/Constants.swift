//
//  Constans.swift
//  MessageApp
//
//  Created by Gentjan Manuka on 2024-04-23.
//

import Foundation
import Firebase

struct FirebaseConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messagesCollection = Firestore.firestore().collection("messages")
}
