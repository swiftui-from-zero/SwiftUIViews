//
//  GroupBox.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicGroupBox: View {
    var body: some View {
        VStack {
            // GroupBox 由两部分组成：可选的标签部分和主题的内容部分
            GroupBox(label: Label("完成训练",
                                  systemImage: "checkmark.circle.fill")) {
                Text("本次总计消耗 300 卡路里")
                Text("已完成本周训练目标")
            }
            // 也可以不传入标签
            GroupBox {
                Text("总计消耗 300 卡路里")
                Text("已完成本周训练目标")
            }
        }
    }
}

struct GroupBox_Previews: PreviewProvider {
    static var previews: some View {
        BasicGroupBox()
    }
}
