//
//  MessengerAppApp.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-02.
//

import SwiftUI
import Firebase

@main
struct MessengerAppApp: App {
    
    @StateObject var chatListViewModel: ChatListViewModel = ChatListViewModel()
    @StateObject var contactListViewModel: ContactListViewModel = ContactListViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(chatListViewModel)
            .environmentObject(contactListViewModel)
        }
    }
}
