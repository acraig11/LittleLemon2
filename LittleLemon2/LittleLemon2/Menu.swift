//
//  OurDishes.swift
//  CoreDataListExercise
//
//  Created by alan craig on 10/8/24.
//
import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State private var menuLoaded = false
    @State var searchText = ""
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
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
        NavigationView {
        VStack {
            Header()
                .frame(maxHeight: 40)
                .background(Color.white)
         Hero()
                .frame(maxHeight: 180)
                .padding()
                
            TextField("Search menu", text: $searchText)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Text("ORDER FOR DELIVERY!")
                .font(.sectionTitle())
                .foregroundColor(.highlightColor1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            HStack(spacing: 20) {
                Toggle("Starters", isOn: $startersIsEnabled)
                Toggle("Mains", isOn: $mainsIsEnabled)
                Toggle("Desserts", isOn: $dessertsIsEnabled)
                Toggle("Drinks", isOn: $drinksIsEnabled)
            }
            .toggleStyle(ChoicesToggleStyle())
            .padding(.horizontal)
            .background(Color.white)
            FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors()){
                        (dishes: [Dish]) in
                        List {
                            ForEach(dishes, id:\.self) { dish in
                                DisplayDish(dish)
                                    .onTapGesture {
                                        showAlert.toggle()
                                  
                                    } //on tap
                            }//for each
                        }//list
                        
                    }//sort
            } .background(Color.primaryColor1)
            
            .padding(.top, -10)
            
            .alert("Order placed, thanks!",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }//alert
            
            // makes the list background invisible, default is gray
            .scrollContentBackground(.hidden)
            
            // runs when the view appears
            .task {
                if !menuLoaded {
                    await dishesModel.reload(viewContext)
                }
                menuLoaded = true
            } //task
        }//nav view
    }//some view
    
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
