//
//  Project: CursorExample
//  File: LoginViewModel.swift
//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    func login() {
        // Reset error message
        errorMessage = nil
        
        // Validate inputs
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields"
            return
        }
        
        guard email.contains("@") else {
            errorMessage = "Please enter a valid email address"
            return
        }
        
        // Simulate login process
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            
            // For demo purposes, accept any email/password combination
            // In a real app, you would make an API call here
            self.isLoggedIn = true
        }
    }
    
    func reset() {
        email = ""
        password = ""
        errorMessage = nil
        isLoading = false
    }
}

