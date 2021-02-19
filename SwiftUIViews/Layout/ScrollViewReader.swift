//
//  ScrollViewReader.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/19.
//

import SwiftUI

struct BasicScrollViewReader: View {
    var body: some View {
        // ScrollViewReader 用于实现 ScrollView 中的快速跳转
        // 它的回调函数会提供一个 ScrollViewProxy 类型的参数，也就是例子中的 scrollView
        // 这个参数有一个 scrollTo 函数，可以通过锚点的值跳转到对应的位置
        ScrollViewReader { scrollView in
            HStack {
                Text("跳转到：")
                ForEach(0..<10) { i in
                    Button("\(i * 10)") {
                        // 这里第一个输入就是锚点的 id，第二个则是表明跳转后对应视图的位置
                        // .center 表示跳转后视图在界面中央
                        // 如果第二个参数使用默认的 nil 的话，就会进行最少的移动使视图出现，
                        // 例如需要向下滑动的话，视图最终会在最下面，向上滑动的话，视图
                        // 最终会在最上面。
                        scrollView.scrollTo(i * 10, anchor: .center)
                    }
                }
            }
            ScrollView {
                LazyVStack {
                    ForEach(0..<100) { i in
                        // 用 .id 标记锚点
                        Text("\(i)").font(.title).id(i)
                    }
                    ForEach(0..<10) { i in
                        // id 值可以重复，但是只会识别第一个
                        Text("\(i)").id(i)
                    }
                }
            }
        }
    }
}

struct ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        BasicScrollViewReader()
    }
}
