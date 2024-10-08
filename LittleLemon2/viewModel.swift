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
    
    func validateUserInput(firstName: String, lastName: String, email: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            
            return false
        }
    return true
    }
       
    
}
