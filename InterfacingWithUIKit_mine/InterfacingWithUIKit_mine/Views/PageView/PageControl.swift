//
//  PageControl.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/4/1.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        // UIPageControl.addTarget()的解释??
        // 答:当 UIPageControl 的 valueChanged 时,调用 context.coordinator 的 updateCurrentPage()方法,参数是 control(UIPageControl类型)。
        // 调用场景:点击图片右下角小圆点，来滑动图片
        control.addTarget(
              context.coordinator,
              action: #selector(Coordinator.updateCurrentPage(sender:)),
              for: .valueChanged)
        
        return control
    }

    // 当本对象 currentPage 发生变化时,将 currentPage 的变化同步给 UIPageControl。
    // 调用场景:滑动图片，图片右下角小圆点跟随变化
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        // 将需要暴露给 Objective-C 使用的如类，属性和方法的声明前面加上 @objc
        // Because UIControl subclasses like UIPageControl use the target-action pattern instead of delegation, this Coordinator implements an @objc method to update the current page binding.
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
