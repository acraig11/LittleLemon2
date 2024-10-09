//
//  MenuScruct.swift
//  CoreDataListExercise
//
//  Created by alan craig on 10/8/24.
//


import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

struct MenuItem: Codable, Hashable, Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let category:String
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case category="category"
    }
    
}
