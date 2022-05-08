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
    private var animals: FetchedResults<Animals> // 遍历的元素即是泛型的元素
    
    @State
    private var newAnimalName = ""

    @State
    private var selectedAnimal:Animals? // 标记要编辑的表项；传递要编辑的表项到save()

    var body: some View {
        VStack{
            TextField("Add New", text: self.$newAnimalName).multilineTextAlignment(.trailing)
            Button("Save"){save(animal: self.selectedAnimal)}
            List{
                ForEach(animals,id: \.self){ animal in
                    Text("\(animal.name!)")
                        .onTapGesture {
                            self.newAnimalName = animal.name!
//                            self.newAnimalName = animal.name ?? ""
                            self.selectedAnimal = animal
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
    
    func save(animal:Animals?){
        if self.selectedAnimal == nil{
            let newAnimal = Animals(context: self.viewContext)
            newAnimal.name = newAnimalName
            try? self.viewContext.save()
        }else{
            viewContext.performAndWait { // ??
                animal!.name = self.newAnimalName
                try? self.viewContext.save()
                self.newAnimalName = ""
                self.selectedAnimal = nil
            }
        }
    }
}

