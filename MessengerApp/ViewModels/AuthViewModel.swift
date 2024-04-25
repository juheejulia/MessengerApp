//
//  SignUpViewModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var signInViewVisible = true
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = "123456"
    @Published var cPassword = "123456"
    
    
    
    func signInUser() async throws {
        try await AuthService.shared.signInUser(withEmail: email, password: password)
    }
    
    func createNewAccount() async throws{
        var alertMessage = "User registered succesfully"
        
        if (self.username.isEmpty) {
            alertMessage = "Enter a username!"
        } else if self.email.isNotValidEmail() {
            alertMessage = "Invalid email!"
        } else if (self.password.isEmpty) {
            alertMessage = "Enter password!"
        } else if (self.cPassword.isEmpty) {
            alertMessage = "Confirm password!"
        } else if (self.cPassword != self.password) {
            alertMessage = "Password doesn't match!"
        } else {
            try await AuthService.shared.createNewAccount(email: email, username: username, password: password)
        }
        
        print(alertMessage)
    }
}
