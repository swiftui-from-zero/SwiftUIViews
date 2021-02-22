//
//  Divider.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicDivider: View {
    var body: some View {
        // Divider 用作分隔符。
        // 在 Stack 中使用时，VStack 中为水平方向，HStack 中为竖直方向
        // 在其他视图中使用时，为水平方向
        VStack {
            HStack {
                Text("左").font(.title)
                Divider()
                Text("右").font(.title)
            }
            VStack {
                Text("上").font(.title)
                Divider()
                Text("下").font(.title)
            }
            List {
                Section {
                    Button("按钮 1") {}
                    Button("按钮 2") {}
                }
                Divider()
                Section {
                    Button("按钮 3") {}
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        BasicDivider()
    }
}
