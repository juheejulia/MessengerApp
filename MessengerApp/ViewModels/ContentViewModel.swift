//
//  ContentViewModel.swift
//  MessengerApp
//
//  Created by Christofer Karlsson on 2024-04-18.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscibers()
    }
    
    private func setupSubscibers(){
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}

