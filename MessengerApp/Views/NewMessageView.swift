//
//  NewMessageView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Environment(\.dismiss ) var dismiss
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text ("CONTACTS")
                    .foregroundColor(.gray)
                    .font (.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(viewModel.users) { user in
                    VStack{
                        HStack(spacing:10) {
                            CircularProfileView(user: user, size: .small)
                            Text (user.username)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                        Divider ()
                            .padding(.leading, 40)
                    }
                    
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NewMessageView( selectedUser: .constant(User.MOCK_USER))
}
