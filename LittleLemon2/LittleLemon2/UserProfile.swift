//
//  UserProfile.swift
//  restaurant
//
//  Created by alan craig on 9/30/24.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedOut = false
    @State private var showingAlert = false
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("profile-image-placeholder")
            VStack{
                Text("First name")
                    .onboardingTextStyle()
                TextField("First Name", text: $firstName)
            }
            VStack {
                Text("Last name")
                    .onboardingTextStyle()
                TextField("Last Name", text: $lastName)
                
            }
            VStack {
                Text("E-mail")
                    .onboardingTextStyle()
                TextField("E-mail", text: $email)
                    .keyboardType(.emailAddress)
            }
            Button("Log Out"){
             
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                firstName=""
                lastName=""
                email=""
                self.presentation.wrappedValue.dismiss()            }
            //button action
                  
           
            
        }  .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
        }
    }
}

#Preview {
    UserProfile()
}
