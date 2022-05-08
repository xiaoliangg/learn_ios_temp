//
//  z01_swiftui_coredata_crudApp.swift
//  z01_swiftui_coredata_crud
//
//  Created by yl on 2022/5/8.
//

import SwiftUI

@main
struct z01_swiftui_coredata_crudApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
