//
//  LandmarkList.swift
//  BuildingListsAndNavigation_mine
//
//  Created by yl on 2022/3/9.
//

import SwiftUI
import MapKit
// 1. \.id 和 Identifiable 协议解释   Lists work with identifiable data。 https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
struct LandmarkList: View {
    var body: some View {
//        List(landmarks,id:\.id){Landmark in
        List(landmarks){Landmark in
            LandmarkRow(landmark: Landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
