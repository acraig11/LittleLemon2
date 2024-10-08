//
//  OurDishes.swift
//  CoreDataListExercise
//
//  Created by alan craig on 10/8/24.
//
import SwiftUI
import CoreData

struct OurDishes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State private var menuLoaded = false
    @State var searchText = ""
    
    static private var sortDescriptors: [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }
    
    @FetchRequest(
        sortDescriptors:
            [],
        animation: .default)
    private var dishes: FetchedResults<Dish>
    
        
    var body: some View {
        VStack {
         
            
            Text ("Tap to order")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color("approvedYellow"))
                .cornerRadius(20)
            
            
            NavigationView {
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List {
                            ForEach(dishes, id:\.self) { dish in
                                DisplayDish(dish)
                                    .onTapGesture {
                                        showAlert.toggle()
                                   print(dish)
                                    }
                            }
                        }
                        .searchable(text: $searchText,
                                    prompt: "search...")
                    }
            }
            
            .padding(.top, -10)
            
            .alert("Order placed, thanks!",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            // makes the list background invisible, default is gray
            .scrollContentBackground(.hidden)
            
            // runs when the view appears
            .task {
                if !menuLoaded {
                    await dishesModel.reload(viewContext)
                }
                menuLoaded = true
            }
        }
    }
    
    private func buildPredicate() -> NSPredicate {
        return searchText == "" ?
        NSPredicate(value: true) :
        NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector:
                            #selector(NSString.localizedStandardCompare))]
    }
}
