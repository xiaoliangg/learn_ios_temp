//
//  HandingUserInput_mineApp.swift
//  HandingUserInput_mine
//
//  Created by yl on 2022/3/23.
//

import SwiftUI

@main
struct HandingUserInput_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
