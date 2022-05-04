import SwiftUI
// 学习测试用，本工程未用到
struct PageView1<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController1(pages: pages)
    }
}

struct PageView1_Previews: PreviewProvider {
    static var previews: some View {
        PageView1(pages: ModelData().features.map { FeatureCard1(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
    }
}

