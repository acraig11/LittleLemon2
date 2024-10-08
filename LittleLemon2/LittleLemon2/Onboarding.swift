//
//  Onboarding.swift
//  restau/Users/alancraig/Capstone-project/littlelemon/littlelemon/littlelemon.xcodeprojrant
//
//  Created by alan craig on 9/29/24.
//

import SwiftUI




struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()
    @State  var firstName: String = ""
    @State  var lastName: String = ""
    @State  var email: String = ""
    @State var isLoggedIn = false
   
        
        
      
    var body: some View {
        NavigationStack {
            VStack{
              
                Hero()      // hero hstack
                     .background(Color.primaryColor1)
                     .padding(.top,50)
                VStack  {
                    
              
                  
                    // start of second vstack
                    VStack{
                        Text(
                            "First Name*"
                            
                        )
                        .onboardingTextStyle()
                        
                        TextField(
                            "first name",
                            text: $firstName
                        )
                        
                        Text(
                            "Last Name*"
                            
                        )  .onboardingTextStyle()
                        TextField(
                            "last name",
                            text: $lastName
                        )
                        Text(
                            "email*"
                            
                        )  .onboardingTextStyle()
                        TextField(
                            "email",
                            text: $email
                        )
                        Button(action: {
                            
                            if viewModel.validateUserInput(firstName:firstName, lastName:lastName, email:email){
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                isLoggedIn = true}
                            
                        }//button action
                               , label: {
                            Text("Register")
                                .font(.title2)
                                .frame(maxWidth: .infinity)
                                
                                .padding(10)
                                .background(Color.primaryColor2)
                            
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                               
                               
                        ) //button
                        
                    } //innermost vstack
                    .frame(alignment:.leading)                } // middle vstack
                //vstack
            }// whole screen vstack
            .frame(alignment:.leading)
            .frame(maxHeight: 1200, alignment: .topLeading)
            
            .navigationDestination(isPresented: $isLoggedIn) {
                OurDishes()}
            //is logged in
        }//nav stack
       
        
    }
}


#Preview {
    Onboarding()
}
