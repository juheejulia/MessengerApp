//
//  SignUpView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var authVM : AuthViewModel
    
    var body: some View {
        ScrollView{
            HStack {
                Text("Sign up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            Button {
                //open photosUI och ladda upp en bild för att sedan spara det i firestore.
            } label: {
                Image(systemName: "person.fill")
                    .font(.system(size: 40))
                    .padding()
                    .background {
                        Circle()
                            .stroke(lineWidth: 3)
                    }
            }
            .frame(width: 100,height: 100)
            
            Group{
                TextField("Username", text: $authVM.username)
                TextField("Email", text: $authVM.email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $authVM.password)
                    .textContentType(.oneTimeCode)
                SecureField("Confirm password", text: $authVM.cPassword)
                    .textContentType(.oneTimeCode)
                
            }.padding(.horizontal)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
            
            Button {
                Task {try await authVM.createNewAccount()}
            } label: {
                
                Text("Create Account")
                    .padding(.horizontal,30)
                    .padding(.vertical,10)
                    .foregroundColor(.white)
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(20)
                    .padding()
                
            }
            
        }
        .padding()
        .lineSpacing(30)
        .background(Color.peachColor.opacity(0.34))
        .overlay {
            VStack{
                Spacer()
                HStack(spacing:10){
                    Text("Alredy have an account?")
                    Button {
                        authVM.signInViewVisible = true
                    } label: {
                        HStack {
                            Text("Sign In")
                        }
                    }
                }
            }
        }
        
    }
}
