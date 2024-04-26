//
//  HomeView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-05.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ChatListView()
            } else {
                AuthView()
            }
        }
    }
}

#Preview {
        ContentView()
}

