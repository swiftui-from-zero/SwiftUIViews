//
//  Toggle.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicToggle: View {
    var body: some View {
        // Toggle 需要绑定一个 Bool 用来记录其状态是开还是关
        Toggle(isOn: $vibrateOnRing) {
            Text("来电振动")
        }
    }

    @State private var vibrateOnRing = false
}

struct StylingToggle: View {
    var body: some View {
        VStack {
            Toggle("来电振动", isOn: $vibrateOnRing)
            Toggle("静音", isOn: $silentOnRing)
        }
        // 可以通过 .toggleStyle 改变 Toggle 样式
        // 注意，SwiftUI 提供的样式中，目前只有 SwitchToggleStyle 可以
        // 在 iOS 上使用，该样式和默认样式相同。
        .toggleStyle(SwitchToggleStyle())
    }
    
    @State private var vibrateOnRing = false
    @State private var silentOnRing = true
}

struct Toggle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicToggle()
            StylingToggle()
        }
    }
}
