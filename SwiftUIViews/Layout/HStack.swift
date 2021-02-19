//
//  HStack.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/19.
//

import SwiftUI

struct BasicHStack: View {
    var body: some View {
        // HStack 用于水平摆放视图。和 LazyHStack 不同的是 HStack 会直接
        // 渲染内部的所有视图。请在内容较少的时候才使用 HStack
        //
        // alignment 用于进行对齐，这里因为所有都是 Text 所以效果不明显
        // spacing 用于指定元素间隔
        HStack(alignment: .top, spacing: 10) {
            ForEach(1...5, id: \.self) {
                Text("\($0) 号选手")
            }
        }
    }
}

struct LayerPriorityBasicHStack: View {
    var body: some View {
        // 我们可以使用 .layoutPriority 来控制 HStack 中元素的布局优先级。
        // 优先级越高的视图会在空间不足的情况下尽量被满足。
        // 数字越高代表优先级越高，默认优先级为 0。
        HStack {
            Text("这个字符串为默认优先级。")
                .font(.largeTitle)
                .border(Color.gray)

            Spacer()

            Text("这个字符串的优先级更高。")
                .font(.largeTitle)
                // 注释这行试试？
                .layoutPriority(1)
                .border(Color.gray)
        }
    }
}

struct HStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicHStack()
            LayerPriorityBasicHStack()
        }
    }
}
