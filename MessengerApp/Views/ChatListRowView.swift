//
//  ChatListRowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct ChatListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: item.isNewMessage ? "circle.fill" : "" )
                    .foregroundColor(item.isNewMessage ? .green : nil)
                Image(systemName: "circle.fill")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(item.name)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Text(item.body)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .position(CGPoint(x: 72.0, y: 10.0))
        }
        //.padding()
        .padding(.vertical, 8)
    }
}


#Preview {
    
    var item1 = ItemModel(name:"Juhee Kang", body: "Hej!", isNewMessage: true)
    var item2 = ItemModel(name:"Julia Johansson", body: "Juhee!", isNewMessage: false)

    
    return ChatListRowView(item: item1)
}
