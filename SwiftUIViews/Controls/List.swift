//
//  List.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicList: View {
    var body: some View {
        VStack {
            // List 就是随平台显示的列表控件，自动支持滑动。
            // 最简单的使用方法就是将需要传入的组件传给 List。
            List {
                Text("低俗小说")
                Text("落水狗")
                Text("杀死比尔")
            }
            // 也常常会结合 ForEach 进行列表的显示
            List {
                ForEach(movies) { movie in
                    Text(movie.title)
                }
            }
            // 也可以直接把循环量直接传给 List
            List(movies) { movie in
                Text(movie.title)
            }
            
        }
    }
}

struct SelectionList: View {
    var body: some View {
        NavigationView {
            // List 还支持传入 selection 参数，是用来配合 EditButton
            // 使用的。添加了 selection 参数后，点击 Edit 就会在左侧
            // 出现选择框了。
            List(movies, id: \.self, selection: $selection) { movie in
                Text(movie.title)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle(Text("Select  \(selection.count) movies"))
        }
    }

    @State var selection = Set<Movie>()
}

struct HierachicalList: View {
    var body: some View {
        // List 还可以像 OutlineGroup 一样显示树状数据
        // 这种模式的使用方法请参照 OutlineGroup
        List(data, children: \.children) { item in
            Text("\(item.description)")
        }
    }
    
    // 这里的 FileItem 是在 OutlineGroup 中定义的
    let data = [FileItem(name: "user1234", children:
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
        ]
}

struct StylingList: View {
    var body: some View {
        List  {
            // 用 Section 来给 List 内的成员分组。
            // 当采用了非默认的 List 的样式的情况下，Section
            // 的分组会显得更明显
            Section {
                Text("低俗小说")
                Text("落水狗")
            }
            Section {
                Text("杀死比尔")
            }
        }
        // 用 .listStyle 来设置 List 样式
        .listStyle(GroupedListStyle())
    }
}

struct Movie: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

let movies = [Movie(title: "低俗小说"),
              Movie(title:  "落水狗"),
              Movie(title: "杀死比尔")]

struct List_Previews: PreviewProvider {
    static var previews: some View {
        BasicList()
        SelectionList()
        HierachicalList()
        StylingList()
    }
}
