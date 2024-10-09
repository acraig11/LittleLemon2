//
//  viewModel.swift
//  restaurant
//
//  Created by alan craig on 10/5/24.
//

import Foundation
import Combine

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kIsLoggedIn = "kIsLoggedIn"
class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
    return true
    }
       
    
}
