//
//  AuthService.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        loadCurrentUserData()
        
        print("Current loged in user id \(userSession?.uid ?? "no one")")
    }
    
    @MainActor
    func signInUser(withEmail email: String, password: String) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("Failed to sign in user \(String(describing: error)) ")
        }
    }
    
    @MainActor
    func createNewAccount(email:String,username:String, password:String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, username: username, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print("Failed to create user \(String(describing: error)) ")
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("failed to sign out user (\(error.localizedDescription)")
        }
    }
    
    @MainActor
    func uploadUserData(email: String, username: String, id: String) async throws{
        let user = User(username: username, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        print("\n\n\nSuccessfully saved user data with :\(id)\n")
        print("With email: \(email) and username \(username)\n\n\n\n")
    }
    
    private func loadCurrentUserData(){
        Task{try await UserService.shared.fetchCurrentUser()}
    }
    
    func deleteAccount() {
        do{
            // hitta referenser på firestore och radera dem där också
            try Auth.auth().currentUser?.delete()
            
            self.userSession = nil
            UserService.shared.currentUser = nil
        } catch {
            print("failed to sign out user (\(error.localizedDescription)")
        }
    }
}
