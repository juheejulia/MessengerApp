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
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
