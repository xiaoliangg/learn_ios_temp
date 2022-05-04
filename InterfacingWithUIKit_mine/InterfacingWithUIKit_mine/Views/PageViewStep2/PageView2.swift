import SwiftUI

struct PageView2<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController2(pages: pages)
    }
}

struct PageView2_Previews: PreviewProvider {
    static var previews: some View {
        PageView2(pages: ModelData().features.map { FeatureCard2(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
    }
}

