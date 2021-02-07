//
//  TabView.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicTabView: View {
    var body: some View {
        // TabView 提供了适合平台的标签页切换 UI
        // 其中的每个子视图就是 TabView 的便签页的内容
        TabView {
            Text("第一个标签页")
                // .tabItem 是每个标签页的图标。
                // 不附上 .tabItem 的话，图标会为空，但是点击对应位置仍然可以实现跳转
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("第一")
                }
            Text("又一个标签页")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("第二")
                }
            Text("最后一个标签页")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("第三")
                }
        }
        .font(.headline)
    }
}

struct SelectionTabView: View {
    var body: some View {
        VStack {
            // TabView 可以用和 Picker 类似的方式获取当前在哪个标签页
            Text("目前在第 \(selection + 1) 个标签页")
            TabView(selection: $selection) {
                Text("第一个标签页")
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("第一")
                    }
                    // 获取的前提是给每个 tablItem 都加上 tag
                    .tag(0)
                Text("又一个标签页")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("第二")
                    }
                    .tag(1)
                Text("最后一个标签页")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("第三")
                    }
                    .tag(2)
            }
            .font(.headline)
        }
    }
    
    @State var selection: Int = 0
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicTabView()
            SelectionTabView()
        }
    }
}
