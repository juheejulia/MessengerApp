//
//  MessageView.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-15.
//

import SwiftUI

struct MessageBubbleView: View {
    
    var message: Message
    
    var body: some View {
        VStack(spacing:5) {
            Text(message.text)
                .multilineTextAlignment(message.isFromCurrentUser() ? .trailing : .leading)
            Text(message.createdAt.extractDate(to: .hour))
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(message.isFromCurrentUser() ? .trailing : .leading)
                .frame(width: 220, alignment: message.isFromCurrentUser() ? .trailing : .leading)
                
            
        }
        .padding(10)
        .frame(maxWidth: 250)
        .background(message.isFromCurrentUser() ? Color.peachColor : Color.mint)
        .cornerRadius(15)
            
        
        
    }
}

#Preview {
    MessageBubbleView(message: Message(userUID: "ujnaoeflknmcöx", text: "Hello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo meet you", photoUrl: "some url", createdAt: Date.now))
}
