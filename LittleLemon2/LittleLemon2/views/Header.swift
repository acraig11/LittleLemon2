//
//  Header.swift
//  restaurant
//
//  Created by alan craig on 10/5/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack{
            Image("Logo")
                .padding(.trailing,20)
            
            NavigationLink(destination: UserProfile()) {
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(maxHeight: 50,alignment: .trailing)
                    .clipShape(Circle())
                   
                    
                    
            }.frame(maxWidth: 240)
            .padding(.leading,100)
        }
    }
}
#Preview {
    Header()
}
