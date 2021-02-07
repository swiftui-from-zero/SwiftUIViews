//
//  Stepper.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicStepper: View {
    var body: some View {
        VStack {
            // Stepper 让用户可以对数量进行加减
            // 构造 Stepper 的时候需要绑定 onIncrement 和 onDecrement
            // Stepper 和 Slider 一样，恶友 onEditingChanged 参数，就不在此展示了
            Stepper(onIncrement: incrementStep,
                onDecrement: decrementStep) {
                Text("值: \(value) 颜色: \(colors[value].description)")
            }
            .padding(5)
            .background(colors[value])
            // 注意 onIncrement 和 onDecrement 可以为 nil，如果为 nil 就
            // 相当于不能进行加或减操作
            Stepper(onIncrement: incrementStep,
                onDecrement: nil) {
                Text("值: \(value) 颜色: \(colors[value].description)")
            }
            .padding(5)
            // Stepper 也可以设置 in 和 step，用于控制用户输入的范围和每一次增加的量
            // 注意，in 需要是 CloseRange，也就是"..."
            Stepper(value: $value2,
                    in: 1...50,
                    step: 5) {
                Text("值2: \(value2)")
            }
            .padding(10)
        }
    }
    
    @State private var value = 3
    @State private var value2 = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]
    
    func incrementStep() { value = (value + 1) % colors.count }

    func decrementStep() {
        value = (value + colors.count - 1) % colors.count
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        BasicStepper()
    }
}
