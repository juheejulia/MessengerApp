//
//  SignUpView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        ScrollView{
            HStack {
                Text("Sing UP")
                    .font(.largeTitle)
                .fontWeight(.bold)
                Spacer()
            }
            
            Button {
                
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
                TextField("Username", text: $signUpViewModel.username)
                TextField("Email", text: $signUpViewModel.email)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $signUpViewModel.password)
                    .textContentType(.oneTimeCode)
                SecureField("Confirm password", text: $signUpViewModel.cPassword)
                    .textContentType(.oneTimeCode)
                
            }.padding(.horizontal)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
            
            
                
            
               
           
               
            
                
                
                
            
            Button {
                signUpViewModel.validateData()
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

#Preview {
    SignUpView()
}
