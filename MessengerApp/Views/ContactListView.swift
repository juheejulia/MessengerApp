//
//  ContactListView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ContactListView: View {
    
    @EnvironmentObject var contactListViewModel: ContactListViewModel
    
    var body: some View {
        
        ZStack {
            List {
                ForEach(contactListViewModel.items) { item in
                    NavigationLink(
                        destination: ChatWindowView()) {
                            ContactListRowView(item: item)
                        }
                 }
                .onDelete(perform: contactListViewModel.deleteItem)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Contact")
        // change text "Add" to "plus circle" icon later
        .navigationBarItems(trailing: NavigationLink("Add", destination: AddContactView())
        )
    }
}

#Preview {
    NavigationView {
        ContactListView()
    }
    .environmentObject(ContactListViewModel())
}



    
    

