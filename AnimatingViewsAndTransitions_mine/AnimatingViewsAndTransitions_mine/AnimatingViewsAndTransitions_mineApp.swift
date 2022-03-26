//
//  AnimatingViewsAndTransitions_mineApp.swift
//  AnimatingViewsAndTransitions_mine
//
//  Created by yl on 2022/3/26.
//

import SwiftUI

@main
struct AnimatingViewsAndTransitions_mineApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
