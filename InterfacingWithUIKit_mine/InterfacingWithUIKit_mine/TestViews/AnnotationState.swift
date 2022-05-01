//
//  AnnotationState.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/4/4.
//  参考: https://onevcat.com/2021/01/swiftui-state/

import SwiftUI

struct AnnotationState: View {
    // yl 经测试，此例中如果不用 @State 注解，下方 value += 1 会报错:
    // Left side of mutating operator isn't mutable: 'self' is immutable 可变操作符的左侧不是可变的:self 是不可变的
    @State private var value = 99
    var body: some View {
        // @State变量基本用法
//        VStack(alignment: .leading) {
//            Text("Number: \(value)")
//            Button("+") { value += 1 }
//        }
        
        
        // 1. 子视图中声明一个变量接收,子视图无需编写其他操作。父视图直接将 @State 类型修饰的变量传参即可
        // 2. 在 ContentView 中的 @State value 发生改变时，ContentView.body 被重新求值，DetailView 将被重新创建，包含新数字的 Text 被重新渲染。
        VStack(alignment: .leading) {
            DetailView(number: value)
            Button("+") { value += 1 }
        }
    }
}

struct AnnotationState_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationState()
    }
}



struct DetailView: View {
    let number: Int
    var body: some View {
        Text("Number: \(number)")
            .bold()
            .foregroundColor(Color.blue)
    }
}
