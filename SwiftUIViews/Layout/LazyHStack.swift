//
//  LazyHStack.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/19.
//

import SwiftUI

struct BasicLazyHStack: View {
    var body: some View {
        ScrollView(.horizontal) {
            // LazyHStack 的用法和 HStack 相同，仅有的区别是它会“惰性初始化”
            // 也就是只有在子视图即将出现在屏幕上的时候，再初始化子视图
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("列 \($0)")
                }
            }
        }
    }
}

struct LazyHStack_Previews: PreviewProvider {
    static var previews: some View {
        BasicLazyHStack()
    }
}
