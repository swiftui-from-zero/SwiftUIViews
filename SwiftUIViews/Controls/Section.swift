//
//  Section.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicSection: View {
    var body: some View {
        List  {
            // Section 主要用来在 List、Form 这样的控件中把列表
            // 划分成小组，所以可以通过查看 List 和 Form 的对应例子
            // 查看 Section 的用法和效果
            // 这里主要补充一些 Section 的其他用法
            Section {
                Text("低俗小说")
                Text("落水狗")
                // 嵌套的 Section 不会有什么效果
                Section {
                    Text("杀死比尔 1")
                    Text("杀死比尔 2")
                }
            }
            // 还可以通过 header 与 footer 参数来设置标题和尾注
            Section(header: Label("其他电影", systemImage: "film"),
                    footer: Text("尾注")) {
                Text("被解救的姜戈")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct Section_Previews: PreviewProvider {
    static var previews: some View {
        BasicSection()
    }
}
