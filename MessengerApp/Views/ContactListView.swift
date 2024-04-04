//
//  ContactListView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ContactListView: View {
    
    @EnvironmentObject var contactListViewModel: ConctactListViewModel
    
    var body: some View {
        
        ZStack {
            List {
                ForEach(contactListViewModel.items) { item in
                    ContactListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                contactListViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: contactListViewModel.deleteItem)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Contact")
        // change text "Add" to "plus circle" icon later
        .navigationBarItems(trailing: NavigationLink("Add", destination: ChatListView())
        //change "ChatListView()" -> "AddContactView()" after implementing
        )
    }
}

#Preview {
    NavigationView {
        ContactListView()
    }
    .environmentObject(ConctactListViewModel())
}



    
    

