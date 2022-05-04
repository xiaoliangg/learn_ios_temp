import SwiftUI

// 学习测试用，本工程未用到
// 1.为什么 pageViewController.setViewControllers 的传参是一个数组？
// 2.UIHostingController的作用？
// 3.UIViewControllerRepresentable 的作用是什么？以下两个方法的作用是什么？
// 答:UIViewControllerRepresentable 有两个必须实现的方法:makeUIViewController(),updateUIViewController(),其他都是可选实现的
struct PageViewController1<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    // UIViewControllerRepresentable 协议的方法
    // yl SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    // 传参 Context:UIViewControllerRepresentableContext
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }
    
    // PageView1可以预览到静态的图片，此方法决定了预览哪一张图片
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[2])], direction: .forward, animated: true)
            
            // 如下会报错
//        [UIHostingController(rootView: pages[0]),UIHostingController(rootView: pages[2])], direction: .forward, animated: true)
    }
}
