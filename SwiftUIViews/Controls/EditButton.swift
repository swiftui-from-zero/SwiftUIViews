//
//  EditButton.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicEditButton: View {
    var body: some View {
        // EditButton 负责控制打开和关闭编辑模式。
        // 当点击开发编辑模式时，SwiftUI 会为我们自动生成符合 iOS 习惯的
        // 删除和移动操作 UI（当然如果我们只绑定了删除，就只会显示删除 UI）。
        //
        // 注意这个编辑模式需要和 NavigationView 相结合
        NavigationView{
            List {
                ForEach(
                    fruits,
                    id: \.self
                ) { fruit in
                    Text(fruit)
                }
                .onDelete { deleteFruit(at :$0) }
                .onMove { moveFruit(from: $0, to: $1) }
            }
            .navigationTitle("水果")
            // 绑定 EditButton 的方法就是使用 .toolbar
            // 或者 .navigationBarItems
            .toolbar { EditButton() }
            // .navigationBarItems 的样式略有不同，
            // 并且可以控制 EditButton 是在左（leading）还是右（trailing）
            // .navigationBarItems(leading: EditButton())
            // .navigationBarItems(trailing: EditButton())
        }
    }
    
    @State private var fruits = ["苹果", "香蕉", "木瓜", "芒果"]
    
    func deleteFruit(at offset: IndexSet) {
        fruits.remove(atOffsets: offset)
    }
    
    func moveFruit(from source: IndexSet, to destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
    }
}

struct BasicEditButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicEditButton()
    }
}
