//
//  WorkingWithUIControls_mineApp.swift
//  WorkingWithUIControls_mine
//
//  Created by yl on 2022/3/27.
//

import SwiftUI

@main
struct WorkingWithUIControls_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
