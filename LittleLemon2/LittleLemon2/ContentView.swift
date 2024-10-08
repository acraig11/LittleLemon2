import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
            sortDescriptors: [],
            animation: .default)
    private var Dishes: FetchedResults<Dish>
            
    var body: some View {
        NavigationView{
            VStack{
                Text("Dishes")
                    .font(.title)
                List {
                    ForEach(Dishes) { Dish in
                        VStack(alignment:.leading){
                            Text (Dish.title!)
                                .font(.system(size: 16, weight: .bold))

                           
                        }
                       
                    }
                }//list
                NavigationLink("ourDishes", destination: OurDishes())
            }//vstack
           .onAppear{createDishes()}
        }
    }
    
    
    
    func createDishes() {
        let profiterole = Dish(context: viewContext)
        profiterole.title = "Profiterole"
      
        profiterole.price = "2.99"
                
        let cremeBurlee = Dish(context: viewContext)
        cremeBurlee.title = "Crème Burlée"
       
        cremeBurlee.price = "3.99"
        
        let iceCream = Dish(context: viewContext)
        iceCream.title = "Ice Cream"
       
        iceCream.price = "5.99"
        
        let applePie = Dish(context: viewContext)
        applePie.title = "Apple Pie"
        
        applePie.price = "2.99"
        
        let imperatrice = Dish(context: viewContext)
        imperatrice.title = "Riz à l'impératrice"
        
        imperatrice.price = "2.99"
        
        let cheeseCake = Dish(context: viewContext)
        cheeseCake.title = "Cheese Cake"
        
        cheeseCake.price = "4.99"
        
        let carrotCake = Dish(context: viewContext)
        carrotCake.title = "Carrot Cake"
       
        carrotCake.price = "3.99"
        
        let piece = Dish(context: viewContext)
        piece.title = "Pièce montée"
        
        piece.price = "5.99"
        
        let eclair = Dish(context: viewContext)
        eclair.title = "Éclair"
        
        eclair.price = "3.99"
        
        let crepe = Dish(context: viewContext)
        crepe.title = "Crêpe Suzette"
       
        crepe.price = "3.99"
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



