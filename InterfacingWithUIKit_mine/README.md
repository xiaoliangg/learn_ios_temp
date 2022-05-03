# 本项目新增功能介绍
集成swift的Controller,实现轮播效果  
学习swiftui如何集成Controller，及原理;  
协议:UIViewRepresentable;UIViewControllerRepresentable

# 理解
PageViewTest 包是写 PageView 包的第一步(可以看提交记录和官网教程)，是为了便于理解。  
## 1. 理解 PageViewTest 包
1.1 PageViewController2 实现了 <b>UIViewControllerRepresentable 协议</b>。在 PageView2 里，可以在原本放 SwiftUI 的 View 类型的地方，放实现了 UIViewControllerRepresentable 协议的类。  
1.2 UIViewControllerRepresentable 的方法的作用:  
* makeUIViewController():  用于创建初始视图控制器 UIViewController
* updateUIViewController(): 用于在某些SwiftUI状态更改时让我们更新视图控制器
1.3 <b>UIHostingController</b> 用于UIKit和SwiftUI的切换
## 2. 理解 PageView 包
在 PageViewTest 的基础上,
2.1 PageViewController 新增了 UIViewControllerRepresentable 的可选方法 makeCoordinator()
2.2 新增了 Coordinator 类，并在 Coordinator 类中新增了初始化方法、视图向前切换方法、视图向后切换方法、更新当前 currentPage 方法
2.3 新增了 <b>UIViewRepresentable</b> 的实现类 PageControl

# 其他介绍
1. FeatureCard.swift 是swiftUI方式实现的View
2. CategoryHome.swift 使用到了UIKit 方式构造出的 View，从使用方看来，与SwiftUI的原生View没有区别
3. 复习 UIPageViewControllerDataSource,UIPageViewControllerDelegate