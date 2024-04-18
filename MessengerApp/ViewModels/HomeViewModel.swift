//
//  HomeViewModel.swift
//  MessengerApp
//
//  Created by Christofer Karlsson on 2024-04-18.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject {
    
    static let shared = HomeViewModel()
    @Published var isUserLoggedIn = false
    
    init() {
        if(Auth.auth().currentUser?.uid != nil) {
            isUserLoggedIn = true
        } else {
            isUserLoggedIn = false
        }
    }
}
