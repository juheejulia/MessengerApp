//
//  SignInView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        ScrollView{
            HStack {
                Text("Sing In")
                    .font(.largeTitle)
                .fontWeight(.bold)
                Spacer()
            }
            
            Spacer(minLength: 200)
            
            TextField("Email", text: $email)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
               
            SecureField("Password", text: $password)
                .padding(.horizontal)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                }
            
            Button {
                
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
#Preview {
    SignInView()
}
