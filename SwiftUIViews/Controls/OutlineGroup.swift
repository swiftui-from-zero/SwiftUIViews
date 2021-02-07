//
//  OutlineGroup.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicOutlineGroup: View {
    var body: some View {
        // OutlineGroup 是用来显示树形结构的数据的空间。
        // 在这个例子中，我们的数据类型是描述的文件，有文件和文件夹的区别
        // OutlineGroup 会自动遍历文件夹的所有子文件，从而绘制出嵌套的
        // 树形 UI。
        //
        // 注意，OutlineGroup 和 DisclosureGroup 的区别：OutlineGroup
        // 是传入的数据为树形接口，自动生成 UI，而DisclosureGroup 则是我们
        // 设计的树形 UI。
        OutlineGroup(data, children: \.children) { item in
            Text("\(item.description)")
        }
    }

    let data =
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name: "Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name: "Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name: "Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem(name: "Documents", children: [])
           ])
        ])
}

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

struct OutlineGroup_Previews: PreviewProvider {
    static var previews: some View {
        BasicOutlineGroup()
    }
}
