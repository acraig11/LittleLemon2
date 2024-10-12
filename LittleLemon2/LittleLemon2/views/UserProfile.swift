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
    @State private var showOrderStatuses = false
    @State private var showPasswordChanges = false
    @State private var showSpecialNotes = false
    @State private var showNewsletter = false
    
    var body: some View {
       
        VStack{
           Header()
            Text("Personal Information")
                .frame(maxWidth: 350,alignment: .leading)
                .font(.title2.bold())
                .padding()
            Text("Avatar")
                .frame(maxWidth: 350,alignment: .leading)
            HStack{
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(maxHeight: 100,alignment: .trailing)
                    .clipShape(Circle())
                    .padding()
                Button(action:{},label:{
                    Text("Change")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(Color.primaryColor1)
                    
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                )
                Button(action:{},label:{
                    Text("Remove")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.primaryColor1)
                        .padding(10)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryColor1, lineWidth: 3))
                      
                        .cornerRadius(8)
                        .padding(.horizontal)
                       
                }
                )
                   
           }
                VStack{
                Text("First name")
                    .onboardingTextStyle()
                    .frame(width: 360)
                TextField("First Name", text: $firstName)
                        .frame(width: 360)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.primaryColor1)
                                
                        )
                        
                        
            }
            VStack {
                Text("Last name")
                   
                    .onboardingTextStyle()
                    .frame(width: 360)
                TextField("Last Name", text: $lastName)
                    .frame(width: 360)
                    .overlay(
                       RoundedRectangle(cornerRadius: 2)
                           .stroke(Color.primaryColor1)
                           
                   )
                   
            }
            VStack {
                Text("E-mail")
                    .onboardingTextStyle()
                    .frame(width: 360)
                TextField("E-mail", text: $email)
                    .frame(width: 360)                    .keyboardType(.emailAddress)
                    .overlay(
                       RoundedRectangle(cornerRadius: 2)
                           .stroke(Color.primaryColor1)
                           
                   )
                   
            }
            Text("Enail Notifications")
            Toggle("Order Statuses", isOn: $showOrderStatuses)
            Toggle("Password Changes", isOn: $showPasswordChanges)
            Toggle("Special Notes", isOn: $showSpecialNotes)
            Toggle("Newsletter", isOn: $showNewsletter)
            
            
            Button("Log Out"){
             
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                firstName=""
                lastName=""
                email=""
                isLoggedOut=true
                         }
            //button action
            .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.primaryColor1)
                .padding(10)
                .background(Color.primaryColor2)
            
                .cornerRadius(8)
                .padding(.horizontal)
            HStack{
               
                Button(action:{},label:{
                    Text("Discard Chamges")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.primaryColor1)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryColor1, lineWidth: 3))
                    
                        .cornerRadius(8)
                        .padding(.horizontal,5)
                        .padding(.vertical,10)
                }
                )
                Button(action:{},label:{
                    Text("Save Changes")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(Color.primaryColor1)
                    
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                )
            }
            
        }.frame(maxHeight:1000,alignment:.topLeading)
        .navigationDestination(isPresented: $isLoggedOut) {
            Onboarding()}
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
               
        }
    }
        
}

#Preview {
    UserProfile()
}
