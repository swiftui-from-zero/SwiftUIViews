//
//  Form.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicForm: View {
    var body: some View {
        // Form 用于分组显示控件，适合用在设置栏这样的场景。
        // SwiftUI 会自动显示适合平台习惯的 UI，例如在 iOS 中，就是分组的 List
        Form {
            // Form 适合和 Section 搭配使用，从而能分组显示控件
            Section {
                Text("登录")
                TextField("用户名", text: $username)
                SecureField("密码", text: $password)
            }
            
            Section {
                Text("注册")
                    .onTapGesture(perform: register)
            }
        }
    }
    
    @State var username = ""
    @State var password = ""
    
    func register() { print("注册新账号") }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        BasicForm()
    }
}
