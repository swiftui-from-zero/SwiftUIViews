//
//  LazyVGrid.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicLazyVGrid: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            // LazyVGrid 用于进行更为自由的横向栅格布局。
            // Lazy 意味着子视图会在即将出现在屏幕上的时候再被渲染。
            // Grid 的布局主要通过传入一个 [GridItem] 类型的 columns 参数控制，
            // GridItem 的种类在下面的注释中有讲解。
            //
            // 尝试在模拟器中转动屏幕，横屏和竖屏时有什么区别
            LazyVGrid(columns: columns) {
                ForEach(0..<100) { i in
                    ColorRect(i: i, horizontal: false)
                        .frame(height: 100)
                }
            }
        }
    }

    // GridItem 用来控制具体的横向布局方式，具体来说，是每一行的高度是多少（因为宽度可以无限延伸）
    // 目前有 3 种 GridItem，fixed, flexible 和 .adaptive
    // - fixed: 表示这行的高度固定为传入的参数
    // - flexible: 一个在一定范围内灵活地取一个高度，默认的最小值为 10，最大值为 .infinity
    // - adaptive: 类似于 flexible，用 adaptive 表示的行的高度可以在指定的范围内灵活地变动。区别在于
    //             当 adaptive 会尽可能地表示为多行，从而把空间占满，而 flexible 只会表示一行。
    // 在进行布局的时候，会先防止 fixed 类型的行，然后将剩余空间平分给 flexible 和 adaptive，adaptive
    // 会根据空间转为多行。
    // 当空间不足的时候，会优先摆放 fixed，其次为 flexible，再其次为 adaptive。
    let columns: [GridItem] = [GridItem(.fixed(50)),
                            GridItem(.flexible(minimum: 50, maximum: 120)),
                            GridItem(.adaptive(minimum: 60, maximum: 80))]
}

struct PinnedLazyVGrid: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            // pinnedViews 可以让头注或脚注在滚动过程中保持在其位置上
            // spacing 用于控制行间距
            LazyVGrid(columns: columns, spacing: 40,
                      pinnedViews: [.sectionHeaders]) {
                Section(header: Text("头注")) {
                    ForEach(0..<30) { i in
                        ColorRect(i: i, horizontal: false)
                            .frame(height: 100)
                    }
                }
            }
        }
    }
    // 用 GridItem 中的 spacing 参数控制列间距
    let columns: [GridItem] = [GridItem(.fixed(80), spacing: 0),
                            GridItem(.fixed(80), spacing: 10),
                            GridItem(.fixed(80), spacing: 0)]
}


struct LazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicLazyVGrid()
            PinnedLazyVGrid()
        }
    }
}
