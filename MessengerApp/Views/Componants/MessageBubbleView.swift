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
        
        /*
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
        */
        
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(.gray).opacity(0.3) : Color(.mint).opacity(0.3))
                    .cornerRadius(30)
            }
            .frame(minWidth: 300, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    
    /*
    MessageBubbleView(message: Message(userUID: "ujnaoeflknmcöx", text: "Hello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo ello i am genti froo meet you", photoUrl: "some url", createdAt: Date.now, received: true))
     */
    
    MessageBubbleView(message: Message(id: "123", text: "I can send a message", received: false, timestamp: Date()))
}
