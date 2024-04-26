//
//  UserService.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class UserService {
    
    static let shared = UserService()
    
    @Published var currentUser: User?
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User)  -> Void) {
        FirebaseConstants.userCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            completion(user)
        }
    }
}
