//
//  ChatWindowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatWindowView: View {
    var messageArray = ["Hello!", "How are you doing?", "I am fine, thank you!"]
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack {
                    UserRowView()
                        .background(.mint.opacity(0.3))
                    ScrollView{
                        ForEach(messageArray, id: \.self) { text in
                            MessageBubbleView(message: Message(
                                userUID: "1234",
                                text: text,
                                photoUrl: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnnwxMjA3fDB8MHxwaG9by1wYWd1fHx8fGVufDB8fHx8",
                                createdAt: Date()))
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                }
            }
        }
    }
}

#Preview {
    ChatWindowView()
}
