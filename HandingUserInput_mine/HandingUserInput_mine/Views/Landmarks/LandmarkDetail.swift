//
//  LandmarkDetail.swift
//  BuildingListsAndNavigation_mine
//
//  Created by yl on 2022/3/9.
//

import SwiftUI

struct LandmarkDetail: View {
    // 用于接收修改 isFavorite
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                    

                // Stack组合多个view
                // 见 https://developer.apple.com/tutorials/swiftui/creating-and-combining-views Section3 Combine Views Using Stacks
                HStack {
                    Text(landmark.park)
                    // Spacer使用
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.green)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            // 可以使地图紧贴顶部
//            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
