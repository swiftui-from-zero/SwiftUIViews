//
//  Button.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/6.
//

import SwiftUI

struct BasicButton: View {
    var body: some View {
        VStack {
            // Button 需要一个 action 和一个 label，
            // 前者的类型是 () -> Void，也就是点击会回调的函数
            // 后者是个表示 Button 的样式的视图
            Button(action: signIn) {
                Text("登录")
            }
            // 对于视图仅仅是文字的情况，也可以在第一个参数里传入 String
            Button("登录", action: signIn)
        }
    }
    
    func signIn() { print("已登录") }
}

struct ListButton: View {
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.title)
            }
            // 容器中的按钮的样式会随容器的样式变化。
            // 例如，如果我们把按钮放在 List 中，
            // 按钮的样子就会类似于 List 里面的一个单元
            Button("添加", action: addItem)
        }
    }

    @State var items: [Item] = [Item(title: "A"), Item(title: "B")]

    struct Item: Identifiable {
        let id = UUID()
        let title: String
    }
    
    func addItem() { items.append(Item(title: "C")) }
}

struct ContextMenuButton: View {
    var body: some View {
        Form {
            TextField("用户名", text: $username)
        }
        .contextMenu {
            // Button 还可以配合 .contextMenu 使用
            // 在这个例子中，如果长按输入框，就会弹出剪切、复制、粘贴三个选项
            // 点击就会调用对应的函数
            Button("剪切", action: cut)
            Button("复制", action: copy)
            Button("粘贴", action: paste)
        }
    }
    
    @State var username: String = ""
    @State var tmp: String = ""
    
    func cut() {
        tmp = username
        username = ""
    }
    func copy() { tmp = username }
    func paste() { username += tmp }
}

struct StylingButton: View {
    var body: some View {
        HStack {
            Button("登录", action: signIn)
            Button("注册", action: register)
        }
        // 可以使用 .buttonStyle 这个 modifier 修改按钮的样式
        // 注意 SwiftUI 默认提供的一些样式不一定能够在所有平台上使用
        // 如果要自定义按钮样式，需要遵从 PrimitiveButtonStyle 协议
        .buttonStyle(PlainButtonStyle())
    }
    
    func signIn() { print("已登录") }
    func register() { print("注册新账号") }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicButton()
            ListButton()
            ContextMenuButton()
            StylingButton()
        }
    }
}
