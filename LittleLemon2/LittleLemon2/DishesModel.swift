//
//  DishesModel.swift
//  CoreDataListExercise
//
//  Created by alan craig on 10/8/24.
//

import Foundation
import CoreData

@MainActor
class DishesModel: ObservableObject {
    
  @Published var menuItems = [MenuItem]()
    
  func reload(_ coreDataContext:NSManagedObjectContext) async {
    let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!

    let urlSession = URLSession.shared
      do {
        let (data, _) = try await urlSession.data(from: url)
        let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
        menuItems = fullMenu.menu
            
        // populate Core Data
          Dish.createDishesFrom(menuItems:menuItems, coreDataContext)
     }
     catch { }
  }
}

