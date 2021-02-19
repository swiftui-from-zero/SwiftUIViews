//
//  LazyVStack.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/19.
//

import SwiftUI

struct BasicLazyVStack: View {
    var body: some View {
        ScrollView {
            // LazyVStack 的用法和 VStack 相同，仅有的区别是它会“惰性初始化”
            // 也就是只有在子视图即将出现在屏幕上的时候，再初始化子视图
            LazyVStack(alignment: .leading, spacing: 5) {
                ForEach(1...100, id: \.self) {
                    Text("行 \($0)")
                }
            }
        }
    }
}

struct LazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        BasicLazyVStack()
    }
}
