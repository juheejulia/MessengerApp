//
//  SignInView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var authVM : AuthViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack {
                    Text("Sing In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                Spacer(minLength: 200)
                
                Group{
                    TextField("Email", text: $authVM.email)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $authVM.password)
                        .textContentType(.oneTimeCode)
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
                
                Button {
                    authVM.signInUser()
                } label: {
                    
                    Text("Sign in")
                        .padding(.horizontal,30)
                        .padding(.vertical,10)
                        .foregroundColor(.white)
                        .background(.mint)
                        .cornerRadius(20)
                        .padding()
                    
                }
                
                
                
                
                
            }
            .padding()
            .lineSpacing(30)
            .background(Color.mint.opacity(0.34))
            .overlay {
                VStack{
                    Spacer()
                    HStack(spacing:10){
                        Text("Don't have an account?")
                        Button {
                            authVM.signInViewVisible = false
                        } label: {
                            HStack {
                                Text("Sign Up")
                            }
                        }
                        
                    }
                }
        }
        }
        
    }
}
