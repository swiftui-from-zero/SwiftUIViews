//
//  Label.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicLabel: View {
    var body: some View {
        VStack {
            // Label 就是图标 + 标题。我们可以用官方提供的 SFSymbol 显示图标
            Label("闪电", systemImage: "bolt.fill")
            // 也可以还是图片的名字
            // Label("闪电", image: "lightning")
        }
    }
}

struct StylingLabel: View {
    var body: some View {
        VStack {
            // 可以用 .labelStyle 来设置 Label 的样式
            // 例如，只显示标题文字:
            Label("闪电", systemImage: "bolt.fill")
                .labelStyle(TitleOnlyLabelStyle())
            // 或者只显示图标
            Label("闪电", systemImage: "bolt.fill")
                .labelStyle(IconOnlyLabelStyle())
            // 也可以利用 LabelStyle 协议，自定义 Label 样式
            Label("闪电", systemImage: "bolt.fill")
                .labelStyle(RedBorderedLabelStyle())
        }
    }
    
    struct RedBorderedLabelStyle : LabelStyle {
        func makeBody(configuration: Configuration) -> some View {
            Label(configuration)
                .border(Color.red)
        }
    }
}

struct GroupStylingLabel: View {
    var body: some View {
        VStack {
            Label("雨", systemImage: "cloud.rain")
            HStack {
                Label("雪", systemImage: "snow")
                Label("太阳", systemImage: "sun.max")
            }
        }
        // 对于成组的 Label，只需要在最外层使用 .labelStyle 就可以更改组内所有的样式了
        .labelStyle(IconOnlyLabelStyle())
    }
}

struct ProgrammableLabel: View {
    var body: some View {
        // Label 还支持我们自己绘制图标
        // 在这里例子里，我们就是画了一个根据用户名自动生成的图标
        // 另外，注意到展示的内容也可以是多个视图的组合。
        Label {
            Text(person.fullName)
                .font(.body)
                .foregroundColor(.primary)
            Text(person.title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        } icon: {
            Circle()
                .fill(person.profileColor)
                .frame(width: 44, height: 44, alignment: .center)
                .overlay(Text(person.initials).foregroundColor(.white))
        }
    }
    
    struct Person {
        let profileColor: Color
        let firstName: String
        let lastName: String
        let title: String
        
        var fullName: String { "\(firstName) \(lastName)" }
        var initials: String { "\(firstName.first!)\(lastName.first!)" }
    }
    
    let person = Person(profileColor: .purple,
                        firstName: "Zilin", lastName: "Zhu",
                        title: "SDE")
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicLabel()
            StylingLabel()
            GroupStylingLabel()
            ProgrammableLabel()
        }
        
    }
}
