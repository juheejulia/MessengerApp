//
//  ContactListRowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ContactListRowView: View {
    
    let item: ContactItemModel
    
    var body: some View {
        VStack {
            HStack {
                //It needs to change to avatar
                Image(systemName: "circle.fill")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(item.name)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
        //.padding()
        .padding(.vertical, 8)
    }
}


#Preview {

    var item = ContactItemModel(name:"Juhee Kang", avatar: "")

    return ContactListRowView(item: item)

}
