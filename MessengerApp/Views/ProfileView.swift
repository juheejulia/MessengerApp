//
//  ProfileView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ProfileView: View {
   
    @State var nightMode: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                
                    Image("Profile 4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .mask(Circle())
                        .padding(20)
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                        .offset(x:50, y: -60)
                    
                }
                
                
                VStack {
                    Text("Profile name")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x: 1, y: -40)
                    
                    
                }
                .padding(20)
                               
            }
            
        }
        
        
        
        List {
            Section {
                Text("Avatar")
                Text("Notices")
                Text("Integrity and safety")
                Toggle("Night Mode", isOn: $nightMode)
                Text("Password and username")
            } header: {
                Text("Settings")
            }
            
        }
        .scrollContentBackground(.hidden)
        
            
        List {
            Section {
                Text("🔥 Fashion")
                Text("🏈 Sports")
                Text("🥐 Hidden gems")
                Text("😂 Funny memes")
            } header: {
                Text("joined groups")
            }
        }
        .scrollContentBackground(.hidden)
        
        Button {
            
        } label: {
            Text("Sign out")
        }
        .tint(.mint)
        
    }
}

#Preview {
    ProfileView()
}
