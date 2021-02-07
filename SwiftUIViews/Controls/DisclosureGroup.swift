//
//  DisclosureGroup.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicDisclosureGroup: View {
    var body: some View {
        // DisclosureGroup 用来分组显示内容，并可以通过 isExpanded 参数
        // 来控制内容默认是展开的还是折叠起来的，默认是折叠起来的。
        DisclosureGroup("设置", isExpanded: $topExpanded) {
            Toggle("选项 1", isOn: $toggleStates.oneIsOn)
            Toggle("选项 2", isOn: $toggleStates.twoIsOn)
            // 可以嵌套 DisclosureGroup 来实现更复杂的树状结构
            DisclosureGroup("详细设置") {
                Text("详细设置说明")
            }
        }
    }
    
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
}

struct DisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        BasicDisclosureGroup()
    }
}
