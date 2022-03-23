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
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //        List(landmarks,id:\.id){Landmark in
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }}
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
        LandmarkList()
            .environmentObject(ModelData())
    }
}
