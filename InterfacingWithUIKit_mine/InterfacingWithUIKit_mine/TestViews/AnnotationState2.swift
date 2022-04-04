//
//  AnnotationState2.swift
//  InterfacingWithUIKit_mine
//
//  Created by yl on 2022/4/4.
//

import SwiftUI

struct AnnotationState2: View {
    @State private var value = 99

    var body: some View {
        List{
            //子视图显示和修改
            DetailView0(number: value)
//            DetailView0(number: $value)  // 与下方的 @Binding 配合使用
            //父视图显示和修改
            Text("AnnotationState2: \(value)")
            Button("+") { value += 1 }
        }
    }
}

struct AnnotationState2_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationState2()
    }
}

struct DetailView0: View {
    @State var number: Int
//    @Binding var number: Int // 与上方的 $value 配合使用
    var body: some View {
        HStack {
            Text("DetailView0: \(number)")
            Button("+") { number += 1 }
        }
    }
}

