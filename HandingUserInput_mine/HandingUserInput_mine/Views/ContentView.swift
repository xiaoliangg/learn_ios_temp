//
//  ContentView.swift
//  BuildingListsAndNavigation_mine
//
//  Created by yl on 2022/3/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
