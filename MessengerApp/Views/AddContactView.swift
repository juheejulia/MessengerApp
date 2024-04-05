//
//  AddContactView.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import SwiftUI

struct AddContactView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var contactListViewModel: ContactListViewModel
    @State var nameTextFieldText: String = ""
    @State var phoneNumberFieldText: String = ""
    // Change for image
    @State var avatar: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack {
            TextField("Name", text: $nameTextFieldText)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
            TextField("Telephone", text: $phoneNumberFieldText)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            Button(action: saveButtonPressed, label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(18)
        .navigationTitle("Add Contact")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsApppropriate() {
            contactListViewModel.addItem(name: nameTextFieldText, phoneNumber: phoneNumberFieldText, avatar: avatar)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsApppropriate() -> Bool {
        if nameTextFieldText.count < 1 {
            alertTitle = "At least 1 caracter long is needed."
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
}



#Preview {
    Group {
        NavigationView {
            AddContactView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ContactListViewModel())
        /*
        NavigationView {
            AddContactView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ChatListViewModel())
        */
    }
}
