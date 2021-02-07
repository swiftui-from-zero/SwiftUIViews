//
//  SecureField.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicSecureField: View {
    var body: some View {
        VStack {
            TextField("用户名", text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            // SecureField 类似 TextField，只是不明文显示输入内容，类似密码输入
            // 创建的方式是传入一个描述的 String，再绑定一个用户输入的 String
            // SecureField 也支持绑定一个 onCommit 的回调函数，可以在用户
            // 完成输入的时候（例如点击回车）就自动调用这个函数
            SecureField("密码", text: $password) {
                handleLogin(username: username, password: password)
            }
            .border(Color(UIColor.separator))
        }
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    func handleLogin(username: String, password: String) {
        print("user \(username) login.")
    }
}

struct SecureField_Previews: PreviewProvider {
    static var previews: some View {
        BasicSecureField()
    }
}
