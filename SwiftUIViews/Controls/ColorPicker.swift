//
//  ColorPicker.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicColorPicker: View {
    var body: some View {
        VStack {
            // 初始化颜色选择器只需要传入一个描述性的 String 和需要绑定的颜色即可
            // 点击右侧的圆圈就会弹出丰富的颜色选择框
            ColorPicker("选择喜欢的颜色", selection: $bgColor)
            // 可以设置关闭透明度的控制
            ColorPicker("选择喜欢的颜色", selection: $bgColor, supportsOpacity: false)
            // 和 Button 类似，ColorPicker 可以在末尾传入一个视图作为标签视图
            ColorPicker(selection: $bgColor) {
                Text("选择喜欢的颜色")
            }
        }
    }
    
    @State var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        BasicColorPicker()
    }
}
