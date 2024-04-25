//
//  CircularProfileView.swift
//  MessageApp
//
//  Created by Gentjan Manuka on 2024-04-21.
//

import SwiftUI

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimensions: CGFloat {
        switch self {
            
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileView: View {
    var user : User?
    let size : ProfileImageSize
    var body: some View {
        ZStackLayout(alignment: .bottomTrailing){
            if let imageUrl = user?.profileImageUrl {
                Image(imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimensions, height: size.dimensions)
                    .clipShape(Circle())
            } else {
                Image(systemName:"person.circle.fill")
                    .resizable()
                    .frame(width: size.dimensions, height: size.dimensions)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    CircularProfileView(user: User.MOCK_USER, size: .large)
}
