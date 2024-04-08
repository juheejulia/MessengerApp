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
    @Published var password = ""
    @Published var cPassword = ""
    
    func signInUser(){
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
            if let error = error {
                print("Failed to sign in user \(String(describing: error)) ")
                return
            }
            print("Succersfuly signed user id:\(result?.user.uid ?? "")")
        }
    }
    
    func createNewAccount(email:String,username:String, password:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user \(String(describing: error)) ")
                return
            }
            print("Succersfuly created user id:\(result?.user.uid ?? "")")
        }
    }
    
    func validateData() {
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
            createNewAccount(email: self.email, username: self.username, password: self.password)
        }
        
        print(alertMessage)
    }
}
