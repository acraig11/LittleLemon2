//
//  Home.swift
//  restaurant
//
//  Created by alan craig on 9/30/24.
//

import SwiftUI
import CoreData
import Foundation
struct Home: View {

    var body: some View {
        
        TabView {
            Menu()
            .font(.title)
            .tabItem({
               
                Label ( "Menu",
                            systemImage: "list.dash")
                }//inside tab item
                )//tab item
           
            OurDishes()
            .font(.title)
            .tabItem({
               
                Label ( "Dishes",
                            systemImage: "list.dash")
                }//inside tab item
                )//tab item
           
       
     
            UserProfile()
            .font(.title)
            .tabItem({
            Label ( "Profile",
                            systemImage: "square.and.pencil")
                }//inside tab item
                )//tab item
           
        }//tabview
        
        .navigationBarBackButtonHidden(true)
    }//some view
} //view

#Preview {
    Home()
}
