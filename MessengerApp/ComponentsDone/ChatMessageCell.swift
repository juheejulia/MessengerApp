//
//  MessageBubbleView.swift
//  MessageApp
//
//  Created by Gentjan Manuka on 2024-04-22.
//

import SwiftUI

struct ChatMessageCell: View {
    
    @State private var showTime = false
    let message: Message
    
    var body: some View {
        
        VStack(alignment: message.isFromCurrentUser ? .leading : .trailing) {
            HStack(alignment:.bottom) {
                if !message.isFromCurrentUser {
                    CircularProfileView(user: message.user, size: .xxSmall)
                }
                Text(message.messageText)
                    .padding()
                    .background(message.isFromCurrentUser ? Color.pink.opacity(0.5) : Color.mint.opacity(0.3))
                    .cornerRadius(15)
            }
            .frame(maxWidth: 280, alignment: message.isFromCurrentUser ? .trailing : .leading)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text(message.timeStamp.dateValue().showTime())
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.isFromCurrentUser ? .trailing: .leading, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.isFromCurrentUser ? .trailing: .leading)
        .padding(message.isFromCurrentUser ? .trailing : .leading , message.isFromCurrentUser ? 20 : 5)
    }
}
