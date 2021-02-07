//
//  ProgressView.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicProgressView: View {
    var body: some View {
        VStack {
            // 显示当前的进度，在这个例子中，每点击一下下面的按钮
            // 进度条就会随着 progress 的增加而增加了。
            // value 需要的是一个 0 到 1 之间的数
            //
            // 注意 ProgressView 不会改变传入的值，所以这里传入的不是绑定值
            ProgressView(value: progress)
            Button("再来", action: { progress += 0.05 })
            // 如果不确定进度的话，可以不传入 value，这样就会显示一个
            // 空转的进度环了。
            ProgressView()
        }
    }
    
    @State private var progress = 0.5
}

struct StylingProgressView: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.25)
            ProgressView(value: 0.75)
        }
        // 可以用 .progressViewStyle 来更改进度条样式
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
    }
    
    struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
        func makeBody(configuration: Configuration) -> some View {
            ProgressView(configuration)
                .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                        radius: 4.0, x: 1.0, y: 2.0)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicProgressView()
            StylingProgressView()
        }
    }
}
