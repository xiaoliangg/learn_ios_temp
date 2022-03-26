/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that display a symbol in a badge.
*/

import SwiftUI

// 底层文件
struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030 // 上下两个图形的间距
                let middle = width * 0.5 // x轴中点
                let topWidth = width * 0.226
                let topHeight = height * 0.488

                path.addLines([
                    CGPoint(x: middle, y: spacing), // 上图形顶点
                    CGPoint(x: middle - topWidth, y: topHeight - spacing), // 上图形左底点
                    CGPoint(x: middle, y: topHeight / 2 + spacing), // 上图中底点
                    CGPoint(x: middle + topWidth, y: topHeight - spacing), // 上图右底点
                    CGPoint(x: middle, y: spacing)
                ])

                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3)) // 下图形中顶点
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing), // 下图形左顶点
                    CGPoint(x: spacing, y: height - spacing), // 下图形左底点
                    CGPoint(x: width - spacing, y: height - spacing), // 下图形右底点
                    CGPoint(x: middle + topWidth, y: topHeight + spacing), // 下图形右顶点
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
