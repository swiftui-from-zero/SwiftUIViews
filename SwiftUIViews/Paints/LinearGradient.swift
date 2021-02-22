//
//  LinearGradient.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/20.
//

import SwiftUI

struct BasicLinearGradient: View {
    var body: some View {
        // LinearGradient 表示线性的颜色渐变
        // 用 startPoint 和 endPoint 表示渐变的起点和中间
        LinearGradient(
            gradient: Gradient(colors: [.red, .white]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct LinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        BasicLinearGradient()
    }
}
