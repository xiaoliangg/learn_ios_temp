//
//  ComposingComplexInterfaces_mineApp.swift
//  ComposingComplexInterfaces_mine
//
//  Created by yl on 2022/3/26.
//

import SwiftUI

@main
struct ComposingComplexInterfaces_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
