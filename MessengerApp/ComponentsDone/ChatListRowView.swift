//
//  ChatListRowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatListRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
            CircularProfileView(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text (message.user?.username ?? "")
                    .font (.subheadline)
                    .fontWeight (.semibold)
                Text(message.messageText)
                    .font (.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack {
                Text (message.timeStamp.dateValue().showTime())
                Image (systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor (.gray)
        }
        .frame(height: 72)
    }
}
