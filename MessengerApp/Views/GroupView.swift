//
//  GroupView.swift
//  MessengerApp
//
//  Created by Christofer Karlsson on 2024-04-12.
//

import SwiftUI

struct Activity {
    let usersUID: [String]?
    let messages: [Message]?
    let title: String
    let lastMessage: String
    let slogan: String
   
}

struct GroupView: View {
    
    @State var activities: [Activity] = [
        Activity(usersUID: nil, messages: nil, title: "Sports", lastMessage: "What a beautiful game with arsenal yesterday", slogan: "COME ON IN"),
        Activity(usersUID: nil, messages: nil, title: "Sports", lastMessage: "What a beautiful game with arsenal yesterday", slogan: "COME ON IN"),
        Activity(usersUID: nil, messages: nil, title: "Sports", lastMessage: "What a beautiful game with arsenal yesterday", slogan: "COME ON IN"),
        Activity(usersUID: nil, messages: nil, title: "Sports", lastMessage: "What a beautiful game with arsenal yesterday", slogan: "COME ON IN")
    ]
    
    var body: some View {
        
        ScrollView {
            ForEach(activities.indices, id:\.self) { activity in
                ActivityCardView(title: "Sports", content: "What a beautiful game with arsenal yesterday", slogan: "COME ON IN", color: .mint)
            }
            
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Games")
                    .font(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                Text("-Have you seen the new skins in Fortnite?!")
                    .opacity(0.7)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Join us!".uppercased())
                    .font(.footnote)
                Spacer()
                HStack {
                    
                    ForEach(Array([1,2,3].shuffled().enumerated()),
                            id: \.offset) { index, number in
                        Image("Profile \(number)")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .mask(Circle())
                            .offset(x: CGFloat((index * -20)))
                    }
                    Button {
                        
                    } label: {
                        Text("Join")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .offset(x:95)
                }
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 350, height: 190)
            .background(.linearGradient(colors: [.indigo,.indigo.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .gray.opacity(0.3), radius: 8, x:0, y:12)
            .shadow(color: .gray.opacity(0.3), radius: 2, x:0, y:1)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Fashion")
                    .font(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                Text("Latest trends")
                    .opacity(0.7)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("SHare your style!".uppercased())
                    .font(.footnote)
                Spacer()
                HStack {
                    
                    ForEach(Array([2,3,4].shuffled().enumerated()),
                            id: \.offset) { index, number in
                        Image("Profile \(number)")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .mask(Circle())
                            .offset(x: CGFloat((index * -20)))
                    }
                    Button {
                        
                    } label: {
                        Text("Join")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .offset(x:95)
                }
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 350, height: 190)
            .background(.linearGradient(colors: [.peachColor,.peachColor.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .gray.opacity(0.3), radius: 8, x:0, y:12)
            .shadow(color: .gray.opacity(0.3), radius: 2, x:0, y:1)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Hidden gems")
                    .font(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                Text("Share your favourite food and sweets  places")
                    .opacity(0.7)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("share!".uppercased())
                    .font(.footnote)
                Spacer()
                HStack {
                    
                    ForEach(Array([2,3,4].shuffled().enumerated()),
                            id: \.offset) { index, number in
                        Image("Profile \(number)")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .mask(Circle())
                            .offset(x: CGFloat((index * -20)))
                    }
                    Button {
                        
                    } label: {
                        Text("Join")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .offset(x:95)
                }
            }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 350, height: 190)
            .background(.linearGradient(colors: [.brown,.brown.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .gray.opacity(0.3), radius: 8, x:0, y:12)
            .shadow(color: .gray.opacity(0.3), radius: 2, x:0, y:1)
        }
    }
}

#Preview {
    GroupView()
}

struct ActivityCardView: View {
    var title: String
    var content: String
    var slogan: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .frame(maxWidth: 170, alignment: .leading)
            Text(content)
                .opacity(0.7)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(slogan.uppercased())
                .font(.footnote)
            Spacer()
            HStack {
                
                ForEach(Array([1,2,4].shuffled().enumerated()),
                        id: \.offset) { index, number in
                    Image("Profile \(number)")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .mask(Circle())
                        .offset(x: CGFloat((index * -20)))
                    
                }
                Button {
                    
                } label: {
                    Text("Join")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .offset(x:95)
                
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 350, height: 190)
        .background(.linearGradient(colors: [color,color.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .gray.opacity(0.3), radius: 8, x:0, y:12)
        .shadow(color: .gray.opacity(0.3), radius: 2, x:0, y:1)
    }
}
