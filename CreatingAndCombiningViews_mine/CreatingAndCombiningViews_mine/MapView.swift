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
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
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
