# 注解/协议/方法 搭配使用分析(参照工程学习):
* ObservableObject
* @Published
* ContentView().environmentObject(modelData)
* @StateObject
* @EnvironmentObject
1. ModelData必须要实现 ObservableObject 协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的，这样其他类中声明 ModelData时，才可以用 @StateObject、@ObservedObject、@EnvironmentObject 修饰，environmentObject()方法才允许作为参数传入。  
* 1.1 当 ModelData 不再实现 ObservableObject 协议时，会报错如下:  
  * @EnvironmentObject报错:Generic struct 'EnvironmentObject' requires that 'ModelData' conform to 'ObservableObject'
  * @StateObject报错:Generic struct 'StateObject' requires that 'ModelData' conform to 'ObservableObject'
  * ContentView().environmentObject(modelData) 报错:Instance method 'environmentObject' requires that 'ModelData' conform to 'ObservableObject'   

2. 在@main修饰的App类里，使用注解 @StateObject 声明 ModelData 变量，并使用 environmentObject() 方法将 modelData 注入为全局的环境变量。  
   * @ObservedObject 不管存储，会随着 View 的创建被多次创建。而 @StateObject 保证对象只会被创建一次。
   * <b>疑问</b>: @StateObject 的作用时什么?? 去掉之后，可以编译运行成功，且没有区别
3. app内需要读取或修改 ModelData 的数据的类，使用 @EnvironmentObject 声明即可。本工程中,LandmarkList.swift 读取了 ModelData的数据;LandmarkDetail.swift修改了 ModelData.landmakrs.isFavorite