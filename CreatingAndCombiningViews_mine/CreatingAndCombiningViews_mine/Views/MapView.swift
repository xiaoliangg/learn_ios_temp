//
//  MapView.swift
//  CreatingAndCombiningViews_mine
//
//  Created by yl on 2022/3/5.
//


import SwiftUI
import MapKit

struct MapView: View {
    // @State解释:You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.
    // 见 https://developer.apple.com/tutorials/swiftui/creating-and-combining-views section5
    // @state 其他博客:https://onevcat.com/2021/01/swiftui-state/
    @State private var region = MKCoordinateRegion(
        // 位置
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        // 半径
        span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
    )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
