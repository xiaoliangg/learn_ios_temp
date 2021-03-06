//
//  CircleImage.swift
//  BuildingListsAndNavigation_mine
//
//  Created by yl on 2022/3/8.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
//        Image("turtlerock")
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image:Image("turtlerock"))
    }
}
