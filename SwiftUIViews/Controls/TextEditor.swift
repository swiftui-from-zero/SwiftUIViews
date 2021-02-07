//
//  TextEditor.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicTextEditor: View {
    var body: some View {
        VStack {
            Spacer()
            // TextEditor 是一个多行、可滚动的文本编辑 UI，通过传入文字的绑定
            // 来获取用户输入或修改的内容。
            //
            // 注意，TextEditor 默认会使用流海部分，在排版的时候需要注意
            // （可以去掉上面的 Spacer 尝试一下）
            TextEditor(text: $fullText)
            // 可以像修饰 Text 一样改变 TextEditor 的样式
            TextEditor(text: $fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
            // 可以用 .lineLimit, .lineSpacing, .minimumScaleFactor 等
            // modifier 修改行间距或字间距
            TextEditor(text: $fullText)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .lineSpacing(10)
        }
    }
    
    @State private var fullText: String =
        "这里有些可编辑的文字...\n第二行也有一些..."
}

struct TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        BasicTextEditor()
    }
}
