//
//  ChatWindowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//UserRowView().background(.mint.opacity(0.3))

import SwiftUI

struct ChatWindowView: View {
    
    @StateObject var viewModel : ChatWindowViewModel
    let user : User
    
    init(user:User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatWindowViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                CircularProfileView(user: user, size: .medium)
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.title).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            ScrollView{
                ForEach(viewModel.messages) { message in
                    ChatMessageCell(message: message)
                }
            }
            Spacer()
            
            HStack {
                TextField("Enteryour message here", text: $viewModel.messageText)
                    .onSubmit {
                        if !viewModel.messageText.isEmpty {
                            viewModel.sendMessage()
                        }
                    }
                    .autocorrectionDisabled()
                    
                Button {
                    if !viewModel.messageText.isEmpty {
                        viewModel.sendMessage()
                    }
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.mint)
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.gray.opacity(0.3))
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
    ChatWindowView( user: User.MOCK_USER)
}
