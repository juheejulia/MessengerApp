//
//  NewMessageViewModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task{try await fetchUsers()}
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let fetchedUsers = try await UserService.fetchAllUsers()
        self.users = fetchedUsers.filter({$0.id != currentUid})    
    }
}

