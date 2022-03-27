//
//  InterfacingWithUIKit_mineApp.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/3/27.
//

import SwiftUI

@main
struct InterfacingWithUIKit_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
