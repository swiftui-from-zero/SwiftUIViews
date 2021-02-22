//
//  LazyHGrid.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicLazyHGrid: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            // LazyHGrid 用于进行更为自由的横向栅格布局。
            // Lazy 意味着子视图会在即将出现在屏幕上的时候再被渲染。
            // Grid 的布局主要通过传入一个 [GridItem] 类型的 rows 参数控制，
            // GridItem 的种类在下面的注释中有讲解。
            //
            // 尝试在模拟器中转动屏幕，横屏和竖屏时有什么区别
            LazyHGrid(rows: rows) {
                ForEach(0..<100) { i in
                    ColorRect(i: i)
                        .frame(width: 80)
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
    let rows: [GridItem] = [GridItem(.fixed(150)),
                            GridItem(.flexible(minimum: 150, maximum: 200)),
                            GridItem(.adaptive(minimum: 80, maximum: 120))]
}

struct PinnedLazyHGrid: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            // pinnedViews 可以让头注或脚注在滚动过程中保持在其位置上
            // spacing 用于控制列间距
            LazyHGrid(rows: rows, spacing: 40, pinnedViews: [.sectionHeaders]) {
                Section(header: Text("头注")) {
                    ForEach(0..<20) { i in
                        ColorRect(i: i)
                            .frame(width: 80)
                    }
                }
            }
        }
    }
    // 用 GridItem 中的 spacing 参数控制行间距
    let rows: [GridItem] = [GridItem(.fixed(200), spacing: 0),
                            GridItem(.fixed(200), spacing: 10),
                            GridItem(.fixed(200), spacing: 0)]
}

let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
struct ColorRect: View {
    let i: Int
    var horizontal: Bool = true
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(colors[i % colors.count])
            .overlay(GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("No. \(i)")
                        if horizontal {
                            Text("h: \(Int(geometry.size.height))")
                        } else {
                            Text("w: \(Int(geometry.size.width))")
                        }
                    }
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
            })
    }
}

struct LazyHGrid_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicLazyHGrid()
            PinnedLazyHGrid()
        }
    }
}
