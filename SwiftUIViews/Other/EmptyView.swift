//
//  EmptyView.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicEmptyView: View {
    var body: some View {
        // EmptyView 表示空视图。
        // 很少会直接创建 EmptyView，在泛型中如果一个视图类型没有初始化，
        // 就会被当成 EmptyView
        VStack {
            EmptyView()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        BasicEmptyView()
    }
}
