//
//  LittleLemon2App.swift
//  LittleLemon2
//
//  Created by alan craig on 10/8/24.
//

import SwiftUI

@main
struct LittleLemon2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OurDishes()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
