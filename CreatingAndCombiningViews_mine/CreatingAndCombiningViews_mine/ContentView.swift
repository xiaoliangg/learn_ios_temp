//
//  ContentView.swift
//  CreatingAndCombiningViews_mine
//
//  Created by yl on 2022/3/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            MapView()
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
