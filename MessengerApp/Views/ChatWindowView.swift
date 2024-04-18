//
//  ChatWindowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatWindowView: View {
    
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                UserRowView()
                    .background(.mint.opacity(0.3))
                ScrollView{
                    ForEach(messagesManager.messages, id: \.id) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                //.cornerRadius(30, corners: [.topLeft, .topRight])
            }
            //.background()
            MessageFieldView()
                .environmentObject(messagesManager)
        }
    }
}

#Preview {
    ChatWindowView()
}
