# 本项目新增功能介绍
集成swift的Controller,实现轮播效果  
学习swiftui如何集成Controller，及原理;  
协议:UIViewRepresentable;UIViewControllerRepresentable

# 理解
PageViewStep 包是写 PageView 包的第一步(可以看提交记录和官网教程)，是为了便于理解。  
## 1. 理解 PageViewStep1 包
效果:静态展示图片，并在图片上加文字。使用了 UIViewControllerRepresentable  
1.1 PageViewController1 实现了 <b>UIViewControllerRepresentable 协议</b>。在 PageView1 里，可以在原本放 SwiftUI 的 View 类型的地方，放实现了 UIViewControllerRepresentable 协议的类。  
1.2 UIViewControllerRepresentable 的方法的作用:  
* makeUIViewController():  用于创建初始视图控制器 UIViewController
* updateUIViewController(): 用于在某些SwiftUI状态更改时让我们更新视图控制器  

1.3 <b>UIHostingController</b> 用于UIKit和SwiftUI的切换

## 2. 理解 PageViewStep2 包
效果:可以左右滑动。新增 Coordinator,并实现 UIPageViewControllerDataSource 协议  
2.1 PageViewController 新增了 UIViewControllerRepresentable 的可选方法 makeCoordinator()
2.2 新增了 Coordinator 类，并在 Coordinator 类中新增了初始化方法、视图向前切换方法、视图向后切换方法

## 3. 理解 PageViewStep3 包
* 效果:PageView 里可以使用 currentPage 参数指定初始显示页面;滑动时显示当前页面的Index;获得当前页的序号,为添加 UIPageControl 做准备  
* 疑问: UIPageViewControllerDelegate 的作用?  答: 用于中滑动图片时，更新 PageView中的currentPage的值;经测试,如果去掉实现 UIPageViewControllerDelegate，会导致图片右下角圆点不跟随滑动图片而变化。但点击右下角，可以切换图片，但是不太稳定，有时会不成功。  

## 4. 理解 PageView 包
效果:当滑动方式切换图片时，右下角小圆点跟着变化;当点击小圆点时，可以切换图片
4.1 新增了 <b>UIViewRepresentable</b> 的实现类 PageControl
4.2 关键技术 @Binding var currentPage. 当滑动图片 或 点击小圆点切换图片时,PageViewController/PageView/PageControl 三个类里的 currentPage 属性都会同步发生变化。

# 其他介绍
1. FeatureCard.swift 是swiftUI方式实现的View
2. CategoryHome.swift 使用到了UIKit 方式构造出的 View，从使用方看来，与SwiftUI的原生View没有区别
3. 复习 UIPageViewControllerDataSource, UIPageViewControllerDelegate