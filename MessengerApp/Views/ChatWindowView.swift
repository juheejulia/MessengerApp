//
//  ChatWindowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatWindowView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Text("Here you can start your chatting")
                }
            }
            //Temporary code, need to replace to the name of person
            .navigationTitle("Chat Window")
    }
}

#Preview {
    ChatWindowView()
}
