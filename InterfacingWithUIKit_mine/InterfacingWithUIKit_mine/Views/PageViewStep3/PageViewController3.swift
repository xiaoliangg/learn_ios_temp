import SwiftUI


// PageViewController2 实现了 UIViewControllerRepresentable
// PageViewController2 包含pages属性,pages类型是FeatureCard3类型,也就是SwiftUI View类型
// PageViewController2 包含 UIViewController,此处是 UIPageViewController;UIViewController 可以设置 dataSource/viewControllers/delegate
// PageViewController2 有上下文context, context里有 Coordinator,Coordinator 里有 当前controller对象的引用,和 pages 对应的 UIHostingController 集合
struct PageViewController3<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
//        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    
    class Coordinator: NSObject, UIPageViewControllerDataSource
//    , UIPageViewControllerDelegate
    {
        var parent: PageViewController3
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController3) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            didFinishAnimating finished: Bool,
//            previousViewControllers: [UIViewController],
//            transitionCompleted completed: Bool) {
//            if completed,
//               let visibleViewController = pageViewController.viewControllers?.first,
//               let index = controllers.firstIndex(of: visibleViewController) {
//                parent.currentPage = index
//            }
//        }

    }
    
}
