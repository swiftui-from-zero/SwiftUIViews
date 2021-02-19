//
//  GeometryReader.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/19.
//

import SwiftUI

struct BasicGeometryReader: View {
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200, alignment: .center)
            .overlay(content)
    }

    var content: some View {
        // GeometryReader 用于获取父视图的大小和位置，
        // 从而让子视图可以随父视图的大小变化而灵活变化其形态和内容
        // 它的输入类型为 (GeometryProxy) -> Content
        // 这里的 GeometryProxy（也就是这里的 geometry）
        // 有 2 个属性和 1 个方法
        // 最常用的是 size: CGSzie，表示父视图的大小
        GeometryReader { geometry in
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .offset(x: geometry.size.width / 4,
                        y: geometry.size.height / 4)
        }
    }
}

struct SafeAreaGeometryReader: View {
    var body: some View {
        Color.white.ignoresSafeArea()
            .overlay(content)
    }

    var content: some View {
        // GeometryProxy 的另一个属性是 safeAreaInsets，
        // 用来表示当前不可用的空间有多少。
        // 例如 safeAreaInsets.top 表示了上方刘海部分加上导航栏的高度
        // safeAreaInsets.bottom 表示下方圆角部分的高度
        GeometryReader { geometry in
            List {
                Text("在模拟器中翻转屏幕，来观察 4 条边上 safeArea 的数值变化").bold()
                Text("safeAreaInsets.top: \(geometry.safeAreaInsets.top)")
                Text("safeAreaInsets.bottom: \(geometry.safeAreaInsets.bottom)")
                Text("safeAreaInsets.leading: \(geometry.safeAreaInsets.leading)")
                Text("safeAreaInsets.trailing: \(geometry.safeAreaInsets.trailing)")
            }
        }
    }
}

struct FrameGeometryReader: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(lineWidth: 5)
                .frame(width: 150, height: 150)
                .overlay(content)
            Spacer()
        }
    }

    var content: some View {
        // 除了上述的两个属性，GeometryProxy 还有 frame 这个方法
        // 这个方法会返回一个 CGRect，可以用来获取父视图相对某一坐标的位置
        // 例子中 .local 获得的就是相对父视图的坐标系，
        // 所以 x, y 都是 0，红色方块和黑框重叠
        // .global 就是父视图相对整体的位置，所以蓝方块也向右下进行了平移
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .path(in: geometry.frame(in: .local))
                    .foregroundColor(.red)
                Rectangle()
                    .path(in: geometry.frame(in: .global))
                    .foregroundColor(.blue)
            }
        }
    }
}

struct BasicGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicGeometryReader()
            SafeAreaGeometryReader()
            FrameGeometryReader()
        }
    }
}
