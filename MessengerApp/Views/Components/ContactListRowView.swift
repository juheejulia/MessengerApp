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
                Image("Profile 5")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .mask(Circle())
                    .padding()
                //Image(systemName: "circle.fill")
                //  .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(item.name)
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                //Text(item.phoneNumber)
                Spacer()
            }
        }
        //.padding()
        .padding(.vertical, 8)
    }
}


#Preview {

    let item = ContactItemModel(name:"Juhee Kang", phoneNumber: "0786543000", avatar: "")

    return ContactListRowView(item: item)

}
