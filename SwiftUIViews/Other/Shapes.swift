//
//  Shapes.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/22.
//

import SwiftUI

struct BasicShapes: View {
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 200))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            // 各个形状没有什么特别的地方，只需要根据文档中的构造函数进行初始化就好了
            // 形状会尽量充满父视图给予的空间，所以可以通过调整父视图或者 .frame 之类的
            // 方式调整他们的形状和尺寸
            //
            // 胶囊型是一种特殊的圆角矩形，其圆角的半径等于变长的一半
            ShapeWithLabel(shape: Capsule(), label: "胶囊型")
            ShapeWithLabel(shape: Circle(), label: "圆形")
            ShapeWithLabel(shape: Ellipse(), label: "椭圆")
            ShapeWithLabel(shape: Rectangle(), label: "长方形")
            ShapeWithLabel(shape: RoundedRectangle(cornerRadius: 25.0), label: "圆角矩形")
            ShapeWithLabel(shape: RoundedRectangle(cornerSize: CGSize(width: 25, height: 50)), label: "椭圆角矩形")
        }
    }
}

struct ShapeWithLabel<Content>: View where Content: View {
    let shape: Content
    let label: String
    
    var body: some View {
        VStack {
            Text(label)
            shape
                .foregroundColor(.blue)
        }
        .frame(height: 100)
        .padding()
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        BasicShapes()
    }
}
