//
//  ChatListView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatListView: View {
    
    @EnvironmentObject var chatListViewModel: ChatListViewModel
    
    var body: some View {
        
        ZStack {
            List {
                ForEach(chatListViewModel.items) { item in
                    NavigationLink(
                        destination: ChatWindowView()) {
                            ChatListRowView(item: item)
                        }
                }
                .onDelete(perform: chatListViewModel.deleteItem)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Chat")
        // change text "Add" to "plus circle" icon later
        .navigationBarItems(trailing: NavigationLink("Add", destination: ContactListView())
        )
    }
}

#Preview {
    NavigationView{
        ChatListView()
    }
    .environmentObject(ChatListViewModel())
}
