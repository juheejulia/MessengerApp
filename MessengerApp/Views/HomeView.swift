//
//  HomeView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            
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
        //.toolbar(.visible, for: .tabBar)
    }
}

#Preview {
        HomeView()
}

