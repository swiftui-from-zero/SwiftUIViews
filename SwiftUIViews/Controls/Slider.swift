//
//  Slider.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicSlider: View {
    var body: some View {
        VStack {
            // Slider 用于让用户在一个连续的范围中取值。
            // 构造 Slider 需要一个绑定的值和一个范围（需要是 CloseRange，
            // 也就是"..."）
            //
            // 注意，Slider 的构造函数其实还支持传入一个 label 参数
            // 这个 label 参数在很多的样式中不会显示，但是 VoiceOver
            // 之类的功能会用这个 Label 来识别该 Slider
            Slider(value: $speed1, in: 0...100)
            Text("\(speed1)")
            // 还支持传入一个 onEditingChanged 参数，这个回调函数会在
            // 编辑开始和编辑结束的时候被调用
            Slider(value: $speed2, in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                })
            Text("\(speed2)")
                .foregroundColor(isEditing ? .red : .blue)
            // 还可以用 minimumValueLabel 和 maximumValueLabel
            // 来显示 Slider 的最大值和最小值
            Slider(value: $speed3, in: 0...100,
                minimumValueLabel: Text("0"),
                maximumValueLabel: Text("100")
            ) {
                // 注意，显示最大值和最小值的情况下，必须要传入结尾的 label 参数
                Text("Speed")
            }
        }
    }
    
    @State private var speed1 = 50.0
    @State private var speed2 = 50.0
    @State private var speed3 = 50.0
    @State private var isEditing = false
}

struct StepSlider: View {
    var body: some View {
        VStack {
            // 还可以用 step 参数来控制滑动增减的单位量，
            // 这样就可以控制用户输入为离散的值了。
            // 例如这个例子就是控制拖动的大小为 5 或者 5 的倍数
            Slider(value: $speed, in: 0...100, step: 5)
            Text("\(speed)")
        }
    }
    
    @State private var speed = 50.0
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicSlider()
            StepSlider()
        }
    }
}
