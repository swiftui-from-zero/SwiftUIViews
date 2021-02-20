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

struct CustomEditButton: View {
    // 可以通过下面的方法获取当前的 EditMode，并实现更复杂的编辑操作
    // 这个例子就是通过改变视图来实现编辑。
    @State var isEditMode: EditMode = .inactive

    @State var sampleData = ["苹果", "香蕉", "木瓜", "芒果"]

    var body: some View {
        NavigationView {
            List(0..<sampleData.count) { i in
                // 通过对不同 edit mode 设置不同视图来修改内容
                if (isEditMode == .active) {
                    TextField("水果", text: $sampleData[i])
                } else  {
                    Text(sampleData[i])
                }
            }
            .navigationTitle(Text("水果"))
            .navigationBarItems(trailing: EditButton())
            // 用 .environment 获取当前的 edit mode，
            // 注意这行需要在添加 EditButton 之后加
            .environment(\.editMode, $isEditMode)
        }
    }
}

struct BasicEditButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicEditButton()
            CustomEditButton()
        }
    }
}
