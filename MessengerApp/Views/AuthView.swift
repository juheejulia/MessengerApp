//
//  AuthView.swift
//  MessengerApp
//
//  Created by Gentjan Manuka on 2024-04-08.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var authVM = AuthViewModel()
    var body: some View {
        if authVM.signInViewVisible {
            SignInView(authVM: authVM)
        } else {
            SignUpView(authVM: authVM)
        }
    }
}

#Preview {
    AuthView()
}
