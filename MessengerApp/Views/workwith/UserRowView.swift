//
//  UserRowView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-17.
//
/*
import SwiftUI

struct UserRowView: View {
    
    var imgUrl = URL(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnnwxMjA3fDB8MHxwaG9by1wYWd1fHx8fGVufDB8fHx8")
    
    var name = "Pippi Longstock"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imgUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    UserRowView()
        .background(.mint.opacity(0.3))
}
*/
