//
//  TextField.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicTextField: View {
    var body: some View {
        VStack {
            // TextField 负责单行的文本输入。除去传入描述信息和绑定的字符串
            // text 之外，还可以传入 onEditingChanged 和 onCommit 这
            // 两个回调函数，前者会在用户开始编辑和结束编辑的时候被调用，后者
            // 则是会在用户点击回车的时候被调用。
            TextField("用户名", text: $username,
                    onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    }, onCommit: {
                        validate(name: username)
                    })
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            Text(username)
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
    
    @State private var username: String = ""
    @State private var isEditing = false
    
    func validate(name: String) { print("校验用户名") }
}

struct FormatTextField: View {
    var body: some View {
        VStack {
            // TextField 不止支持绑定 String。
            // 利用 formatter 参数，TextField 就可以用来绑定值了
            TextField("您的名字", value: $nameComponents,
                     formatter: nameFormatter,
                     onCommit: {
                        validate(components: nameComponents)
                     })
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            Text(nameComponents.debugDescription)
        }
    }

    let nameFormatter = PersonNameComponentsFormatter()
    @State private var nameComponents = PersonNameComponents()
    
    func validate(components: PersonNameComponents) {
        print("校验名字")
    }
}

struct StylingTextField: View {
    var body: some View {
        VStack {
            TextField(
                "名",
                 text: $givenName)
                .disableAutocorrection(true)
            TextField(
                "姓",
                text: $familyName)
                .disableAutocorrection(true)
        }
        // 可以用 .textFieldStyle 来改变 TextField 的样式
        // 这里我们把 TextField 的边框改为圆角了
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    @State private var givenName: String = ""
    @State private var familyName: String = ""
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicTextField()
            FormatTextField()
            StylingTextField()
        }
    }
}
