//
//  Menu.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicMenu: View {
    var body: some View {
        VStack {
            // Menu 用来创建一个点击后会弹出若干选项的按钮
            Menu("目录") {
                Button("重命名", action: rename)
                Button("删除", action: delete)
                // 可以插入一般视图，不一定是按钮
                // Menu 可以进行嵌套
                Menu("复制") {
                    Button("复制", action: copy)
                    Button("格式复制", action: copyFormatted)
                    Button("复制路径", action: copyPath)
                }
                Label("标签", systemImage: "pencil.slash")
            }
            // 除去用字符串作为 Menu 的标识，也可以传入一个 label 视图
            Menu {
                Button("在预览中打开", action: openInPreview)
                Button("保存为 PDF", action: saveAsPDF)
            } label: {
                Label("PDF", systemImage: "doc.fill")
            }
        }
        
    }

    func delete() {}
    func rename() {}
    func copy() {}
    func copyFormatted() {}
    func copyPath() {}

    func openInPreview() {}
    func saveAsPDF() {}
}

struct StylingMenu: View {
    var body: some View {
        Menu("编辑") {
            Button("出发地", action: setInPoint)
            Button("目的地", action: setOutPoint)
        }
        // 可以使用 .menuStyle 这个 modifier 修改 Menu 的样式
        // 注意 SwiftUI 默认提供的一些样式只有一种适用于 iOS
        .menuStyle(BorderlessButtonMenuStyle())
    }
    
    func setInPoint() {}
    func setOutPoint() {}
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicMenu()
            StylingMenu()
        }
    }
}
