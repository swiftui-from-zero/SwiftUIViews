//
//  Picker.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicPicker: View {
    var body: some View {
        VStack {
            // 在 Picker 中通过 Text 加 .tag 的方式添加选项，
            // 并在 selection 输入中绑定用户选择的结果。
            Picker("口味", selection: $selectedFlavor) {
                Text("巧克力").tag(Flavor.chocolate)
                Text("香草").tag(Flavor.vanilla)
                Text("草莓").tag(Flavor.strawberry)
            }
            Text("您选择的是: \(selectedFlavor.value)")
        }
    }
    
    @State private var selectedFlavor = Flavor.chocolate
}

struct IteratingPicker: View {
    var body: some View {
        VStack {
            // Picker 也可以结合 ForEach，直接为某个枚举的所有情况制作选项
            //
            // 注意，在文档中提到，如果类型匹配的话，ForEach 会自动添加 tag
            // 这一点在我的实验中并不起作用...
            Picker("请选择一个配料：", selection: $suggestedTopping) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.value)
                        .tag(flavor.suggestedTopping)
                }
            }
            Text("推荐配料：\(suggestedTopping.value)")
        }
    }
    
    @State private var selectedFlavor = Flavor.chocolate
    @State var suggestedTopping: Topping = .cookies
}

struct StylingPicker: View {
    @State private var selectedFlavor = Flavor.chocolate
    @State private var selectedTopping = Topping.nuts

    var body: some View {
        VStack {
            Picker("口味", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.value).tag(flavor)
                }
            }
            Picker("配料", selection: $selectedTopping) {
                ForEach(Topping.allCases) { flavor in
                    Text(flavor.value).tag(flavor)
                }
            }

            Text("您选择的口味是：\(selectedFlavor.value)")
            Text("您选择的配料是：\(selectedTopping.value)")
        }
        // 可以通过 .pickerStyle 来改变 Picker 的样式
        .pickerStyle(SegmentedPickerStyle())
    }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
    
    var value: String {
        switch self {
            case .chocolate:
                return "巧克力"
            case .vanilla:
                return "香草"
            case .strawberry:
                return "草莓"
        }
    }
    
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts
    case cookies
    case blueberries

    var id: String { self.rawValue }
    
    var value: String {
        switch self {
            case .nuts:
                return "坚果"
            case .cookies:
                return "饼干碎"
            case .blueberries:
                return "蓝莓"
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicPicker()
            IteratingPicker()
            StylingPicker()
        }
    }
}
