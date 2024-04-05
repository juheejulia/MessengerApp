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
                ForEach(0..<10) { item in
                    ContactListRowView(item: ContactItemModel(id:"", name: "Bamse", phoneNumber: "1234567890", avatar: ""))
                 }
                //.onDelete(perform: contactListViewModel.deleteItem)
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



    
    

