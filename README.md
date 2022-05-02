# learn_ios_temp
用于记录学习过程
## 工程描述
*  工程按时间顺序
*  mine为我自己的工程,另外一个是苹果官网下载下来的工程  

|  project     | 官网地址  | 功能描述  | 关键词 | 截图展示
|  :---        | :---     | :---    | :---  | :---  |
| ToolbarSearch_mine<br>ToolbarSearch  | - | OC+storyboard实现搜索框; | UISearchBarDelegate, UIPopoverControllerDelegate;自定义Delegate;自定义storyboard | <a href="https://github.com/xiaoliangg/learn_ios_temp/blob/main/screenshots/ToolbarSearch.png">app截图</a>｜
| TabBarDemo_mine  | - | tab切换;设置启动屏幕;设置闹钟 | OC;storyboard |
| CreatingAndCombiningViews_mine<br>CreatingAndCombiningViews  | [官网教程](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views) | swiftui创建view并展示详情 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |
| CreatingAndCombiningViews_mine  | [官网教程]() | tab切换 | storyboard |



## 注解总结  
[[译]理解 SwiftUI 里的属性装饰器@State, @Binding, @ObservedObject, @EnvironmentObject](https://juejin.cn/post/6844903924084768776)
* @main,

### @State  
[关于 SwiftUI State 的一些细节](https://onevcat.com/2021/01/swiftui-state/)
1. 通过使用 @State 修饰器我们可以关联出 View 的状态. SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的. 当 @State 装饰过的属性发生了变化，SwiftUI 会根据新的属性值重新创建视图
2. 见 AnnotationState.swift(InterfacingWithUIKit_mine)
### @StateObject
[@StateObject 和 @ObservedObject 的区别和使用](https://onevcat.com/2020/06/stateobject/)
1. @ObservedObject 不管存储，会随着 View 的创建被多次创建。而 @StateObject 保证对象只会被创建一次。因此，如果是在 View 里自行创建的 ObservableObject model 对象，大概率来说使用 @StateObject 会是更正确的选择。@StateObject 基本上来说就是一个针对 class 的 @State 升级版。
### @EnvironmentObject,environmentObject()方法
1. 这个修饰器是针对全局环境的。通过它，我们可以避免在初始 View 时创建 ObservableObject, 而是从环境中获取 ObservableObject
2. 使用方式:在父视图或根视图使用 .environmentObject(modelData) 设置环境变量；中需要使用的视图引用:@EnvironmentObject var modelData: ModelData
### @Published,@ObservedObject,ObservedObject协议
1. @ObservedObject 的用处和 @State 非常相似，从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用。如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现 ObservableObject 协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的
2. 示例见:PublishAndObservedObject(InterfacingWithUIKit_mine)

### @Environment  
[SwiftUI内功之Environment深入研究与使用](https://www.jianshu.com/p/53d9672c7616)
 1. 传递系统范围的设置，如 ContentSizeCategory(修改字体),LayoutDirection(布局方向),ColorScheme(配色方案) 等
 2. Environment还包含特定于应用程序的内容，例如 UndoManager(撤销和重做),NSManagedObjectContext(被管理的数据上下文,用于数据持久化中的crud)
 3. 默认情况下，SwiftUI中的每个视图都从其父视图继承Environment。但是请记住，通过附加环境修饰符，可以在创建子视图时覆盖所需的任何值。
 4. SwiftUI使用Environment注入当前视图特定的值，例如isEnabled，editMode，presentationMode，horizo​​ntalSizeClass，verticalSizeClass等
 5. 环境的另一个重要用例是依赖注入。关键注释和方法:@EnvironmentObject,environmentObject()
### @Binding  
1. 有时候我们会把一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了。
2. 使用方式:在子视图里用 @Binding 修饰 showFavorited 属性, 在传递属性是使用 $ 来传递 showFavorited 属性的引用，这样子视图就能读写父视图里的状态值了，并且值发生了修改 SwiftUI 会更新父视图和子视图。示例见:1.AnnotationBinding.swift(InterfacingWithUIKit_mine); 2. git show ed9864011dc42a7e48396b73927f91a8f94a834b  
3. Toggle 组件的创建也使用 showFavorited 这种格式，因为 Toggle 组件会修改传入的值，如果是一个纯读的组件比如 Text 就不需要 使用showFavorited， 直接 Text(showFavorited) 使用就好了

### @objc
[Swift学习之@objc](https://www.jianshu.com/p/b651126b1b1d)
1. 将需要暴露给 Objective-C 使用的如类，属性和方法的声明前面加上 @objc

## swiftui原理
[SwiftUI：原理](https://www.jianshu.com/p/3c71706ef71d)
### some 关键字
1. some View 这种写法使用了 Swift 的新特性 Opaque return types 。它向编译器作出保证，每次 body 得到的一定是某一个确定的遵守 View 协议的类型，但是请编译器网开一面，不要再细究具体的类型。返回类型确定单一这个条件十分重要，比如，下面的代码也是无法通过的。
```java
var body: some View
{
    if someCondition
    {
        // 这个分支返回 Text
        return Text("Hello World")
    }
    else
    {
        // 这个分支返回 Button，和 if 分支的类型不统一
        return Button(action: {}) {
            Text("Tap me")
        }
    }
}
```
2. 这是一个编译期间的特性，在保证associatedtype protocol的功能的前提下，使用 some 可以抹消具体的类型。

### ViewBuilder的解释 **未完成**