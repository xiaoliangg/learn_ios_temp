//
//  DrawingPathsAndShapes_mineApp.swift
//  DrawingPathsAndShapes_mine
//
//  Created by yl on 2022/3/26.
//

import SwiftUI

@main
struct DrawingPathsAndShapes_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
