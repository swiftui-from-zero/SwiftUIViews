//
//  ZStack.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/17.
//

import SwiftUI

struct BasicZStack: View {
    var body: some View {
        // ZStack 的基本用法就是使用
        ZStack {
            Rectangle().fill(Color.blue)
            Circle().fill(Color.orange)
            Text("ZStack").font(.title)
        }
    }
}

struct IgnoreSafeZStack: View {
    var body: some View {
        ZStack {
            // 注意
            ZStack {
                Color.purple
            }
            // 这里默认 .ignoresSafeArea() 为
            // .ignoreSafeArea(.all, edges: .all)
            // 第一个个值可以为 .keyboard，它是指在打开键盘的时候，
            // 键盘后面是否隐约有颜色，用模拟器试试吧~
            .ignoresSafeArea(.all, edges: .bottom)
            Color.green
            // 在模拟器中用 command + K 打开键盘，应该可以看到
            // 键盘的下有隐约的紫色
            TextField("您的输入：", text: $fullText)
        }
    }
    
    @State var fullText: String = ""
}

struct ZIndexZStack: View {
    var body: some View {
        ZStack {
            // 可以用 zIndex 调整 ZStack 中视图的顺序，
            // zIndex 越大的视图会被放在越上面
            // zIndex 可以是负数，如果不标注的话 zIndex 为 0
            Text("ZStack").font(.title).zIndex(2)
            Circle().fill(Color.orange).zIndex(1)
            Rectangle().fill(Color.blue).zIndex(0)
        }
    }
}

struct ZStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicZStack()
            IgnoreSafeZStack()
            ZIndexZStack()
        }
    }
}
