//
//  ChatListRowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI



struct ChatListRowView: View {
    
    let item: MessageItemModel
    
    var body: some View {
        HStack (alignment: .top, spacing: 12) {
            Image(systemName: item.isNewMessage ? "circle.fill" : "" )
                .foregroundColor(item.isNewMessage ? .green : nil)
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 45, height: 45)
                .foregroundColor(Color(.systemGray4))
            VStack(alignment: .leading, spacing: 4) {
                //Text(item.name)   This will be used in acture
                Text("Pippi Longstocking")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                //Text(item.body)    This will be used in acture
                Text("This is test message that is quite long so we can see how it is viewed.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday") //It needs to replace real time stamp
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .frame(height: 55)
    }
}


#Preview {
    
    //let item1 = MessageItemModel(name:"Juhee Kang", body: "Hej!", isNewMessage: true)
    let item2 = MessageItemModel(name:"Julia Johansson", body: "Juhee!", isNewMessage: false)

    return ChatListRowView(item: item2)
}
