//
//  ContentView.swift
//  BuildingListsAndNavigation_mine
//
//  Created by yl on 2022/3/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    

                // Stack组合多个view
                // 见 https://developer.apple.com/tutorials/swiftui/creating-and-combining-views Section3 Combine Views Using Stacks
                HStack {
                    Text("Joshua Tree National Park")
                    // Spacer使用
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.green)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            // 可以使地图紧贴顶部
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
