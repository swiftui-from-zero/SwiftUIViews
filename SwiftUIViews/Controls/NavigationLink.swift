//
//  Navigation.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicNavigationLink: View {
    var body: some View {
        NavigationView {
            List(0..<3) { i in
                // NavigationLink 负责控制导航页的点击跳转
                // 其主要有两个参数：destination 是跳转的目的地；
                // label 导航栏中对应格子的标签
                NavigationLink(
                    destination: Text("View \(i)")) {
                        Text("Item \(i)")
                    }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

struct NavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        BasicNavigationLink()
    }
}
