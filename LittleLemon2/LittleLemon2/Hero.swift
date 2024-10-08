//
//  Hero.swift
//  restaurant
//
//  Created by alan craig on 10/5/24.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        HStack{
            
            
            VStack {
                
                Text("Little Lemon")
                    .foregroundColor(Color.primaryColor2)
                    .font(.displayFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.subTitleFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("""
             We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
             """)
                .foregroundColor(.white)
                .font(.leadText())
                .frame(maxWidth: .infinity, alignment: .leading)
            }//hero text vstack
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 240)
            Image("hero-image")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(maxWidth: 120, maxHeight: 140)
                .clipShape(Rectangle())
                .cornerRadius(16)
        }
    }
}

#Preview {
    Hero()
}
