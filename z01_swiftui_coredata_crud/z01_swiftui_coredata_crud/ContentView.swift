//
//  ContentView.swift
//  z01_swiftui_coredata_crud
//
//  Created by yl on 2022/5/8.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Animals.entity(),sortDescriptors: [],animation: .default)
    private var animals: FetchedResults<Animals>
    
    @State
    private var newAnimalName = ""

    var body: some View {
        VStack{
            TextField("Add New", text: self.$newAnimalName).multilineTextAlignment(.trailing)
            Button("Save"){save()}
            List{
                ForEach(animals,id: \.self){ animal in
                    Text("\(animal.name!)")
                        .onTapGesture {
                            self.newAnimalName = animal.name!
//                            self.newAnimalName = animal.name ?? ""
                        }
                    
                }
                .onDelete(perform: {(indexSet)->Void in
                    for index in indexSet{
                        self.viewContext.delete(self.animals[index])
                        try? self.viewContext.save()
                    }
                })
            }
        }
    }
    
    func save(){
        let newAnimal = Animals(context: self.viewContext)
        newAnimal.name = newAnimalName
        try? self.viewContext.save()
    }
}

