//
//  Text.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicText: View {
    var body: some View {
        VStack {
            // Text 用来展示一段文字
            Text("Selected 名著精选")
            // 可以用类似 .title, .caption 这样的字号设置字体
            // SwiftUI 会自动为你匹配对应平台的合适字号
            Text("Hamlet 哈姆雷特")
                .font(.title)
            // 如果需要进行细致的调试，可以设置字体，字号，是否有衬线等等。
            // 也可以利用 .bold 或 .italic 进行加粗或使用斜体
            // 注意目前衬线功能对中文无效
            Text("by William Shakespeare 莎士比亚著")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()
            // Text 会占据显示其内容所必需的空间。不过你可以调整内容的布局。
            // 例如，你可以用 .frame 来控制视图的某一个维度，Text 会自适应的调整布局
            Text("To be, or not to be, that is the question:")
                .frame(width: 100)
            // 你还可以用 .lineLimit, .allowsTightening, .minimumScaleFactor,
            // .trancationMode 等 modifier 控制显示的内容
            Text("Brevity is the soul of wit.")
                .frame(width: 100)
                .lineLimit(1)
            // 可以这样使用非系统默认的字体
            // 在 UIFont.familyNames 中可以查看所有可以使用的字体
            Text("Text(\"Hello World!\")")
                .font(.custom("Menlo", size: 17))
        }
        
    }
}

struct Text_Previews: PreviewProvider {
    static var previews: some View {
        BasicText()
    }
}
