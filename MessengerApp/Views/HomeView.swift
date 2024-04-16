//
//  HomeView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-05.
//

import SwiftUI
import Firebase

struct HomeView: View {
    var body: some View {
        if Auth.auth().currentUser?.uid != nil {
            TabView{
                ContactListView()
                    .tabItem {
                        Label("Contact", systemImage: "list.bullet.rectangle.portrait")
                    }
                ChatListView()
                    .tabItem {
                        Label("Chat", systemImage: "message")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage:"person.circle")
                    }
            }
        } else {
            AuthView()
        }
    }
}

#Preview {
        HomeView()
}

