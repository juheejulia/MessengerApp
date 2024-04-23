//
//  ChatListView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI


struct ChatListView: View {
    @State var showMessageView = false
    @StateObject var viewModel = ChatListViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user : User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            
            List {
                // ActiveNowView()
                ForEach(viewModel.recentMessages) { message in
                    ZStack{
                        NavigationLink(value: message) {
                            EmptyView()
                        }.opacity(0)
                        ChatListRowView(message: message)
                    }
                    
                    
                }
            }.listStyle(.plain)
                .onChange(of: selectedUser, {
                    showChat = selectedUser != nil
                })
                .navigationDestination(for: Message.self, destination: { message in
                    if let user = message.user {
                        ChatWindowView(user: user)
                    }
                })
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .navigationDestination(isPresented: $showChat , destination: {
                    if let user = selectedUser {
                        ChatWindowView(user: user)
                    }
                })
                .fullScreenCover(isPresented: $showMessageView, content: {
                    NewMessageView(selectedUser: $selectedUser)
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            NavigationLink(value: user) {
                                CircularProfileView(user: user, size: .xSmall)
                            }
                            Text("Chat")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showMessageView.toggle()
                            selectedUser = nil
                        } label: {
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(Color(.systemGray5), .black)
                        }
                        
                    }
                }
        }
    }
}
