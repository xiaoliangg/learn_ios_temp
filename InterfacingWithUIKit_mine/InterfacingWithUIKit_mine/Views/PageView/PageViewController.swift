//
//  PageViewController.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/4/1.
//

import SwiftUI
//import UIKit  //官网源码也有此行代码，但是注释掉也不会报错

// UIViewControllerRepresentable 点击去，注释很详细
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int

    // yl SwiftUI calls this makeCoordinator() method before makeUIViewController(context:),
    // UIViewControllerRepresentable 协议的方法
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // UIViewControllerRepresentable 协议的方法
    // yl SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    // 传参 Context:UIViewControllerRepresentableContext
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        // yl If dataSource is nil, user gesture-driven navigation will be disabled.
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    // UIViewControllerRepresentable 协议的方法
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()


        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // These two methods establish the relationships between view controllers, so that you can swipe back and forth between them.
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
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                // 更新当前索引
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first, // 与 setViewControllers()对应
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
