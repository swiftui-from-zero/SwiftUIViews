//
//  Link.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicLink: View {
    var body: some View {
        VStack {
            // 用链接的描述和地址来初始化 Link
            Link("zhuzilin 的 github",
                  destination: URL(string: "https://github.com/zhuzilin")!)
            // Link 可以和 Text 一样调整文字的样式
            Link("zhuzilin 的 github",
                  destination: URL(string: "https://github.com/zhuzilin")!)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}

struct Link_Previews: PreviewProvider {
    static var previews: some View {
        BasicLink()
    }
}
