//
//  GroupView.swift
//  MessengerApp
//
//  Created by Christofer Karlsson on 2024-04-12.
//

import SwiftUI

struct GroupView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Sports")
                    .font(.title2)
                    .frame(maxWidth: 170, alignment: .leading)
                Text("-What a beuty goal by the Rangers last night!")
                    .opacity(0.7)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Come on in!".uppercased())
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
            .background(.linearGradient(colors: [.mint,.mint.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .gray.opacity(0.3), radius: 8, x:0, y:12)
            .shadow(color: .gray.opacity(0.3), radius: 2, x:0, y:1)
            
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
