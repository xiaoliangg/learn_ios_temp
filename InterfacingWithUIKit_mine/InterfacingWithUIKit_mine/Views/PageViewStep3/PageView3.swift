import SwiftUI

struct PageView3<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 2

    var body: some View {
        VStack{
            PageViewController3(pages: pages, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
        }
    }
}

struct PageView3_Previews: PreviewProvider {
    static var previews: some View {
        PageView3(pages: ModelData().features.map { FeatureCard3(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
    }
}

