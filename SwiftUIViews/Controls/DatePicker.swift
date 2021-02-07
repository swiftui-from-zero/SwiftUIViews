//
//  DatePicker.swift
//  SwiftUIViews
//
//  Created by Zilin Zhu on 2021/2/7.
//

import SwiftUI

struct BasicDatePicker: View {
    var body: some View {
        VStack {
            // DatePicker 的使用非常简单，
            // 类似 ColorPicker，只需要绑定上 Date 变量即可
            // 在使用时点击右侧的时间（日期），即可进行选择
            DatePicker(
                "起始日期",
                selection: $date,
                displayedComponents: [.date]
            )
            // 可以通过 displayedComponents 控制时间的精细程度
            // 可选的值为 DatePickerComponents.hourAndMinute 和
            // DatePickerComponents.date
            DatePicker(
                "起始日期",
                selection: $date,
                displayedComponents: [.hourAndMinute, .date]
            )
        }
    }

    @State private var date = Date()
}

struct RangeDatePicker: View {
    var body: some View {
        // 可以通过 in 参数控制选择的时间范围，本例就只能让用户在 2021 年中进行选择
        // 注意传入的时间范围必须是 CloseRange，也就是 ”...”，而不能是 "..<"
        DatePicker(
            "起始日期",
             selection: $date,
             in: dateRange,
             displayedComponents: [.date]
        )
    }
    
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
}

struct StylingDatePicker: View {
    var body: some View {
        DatePicker(
            "起始时间",
            selection: $date,
            displayedComponents: [.date]
        )
        // 类似 Button 的 .buttonStyle，我们可以转换日期显示的样式
        // 除去这里使用的 GraphicalDatePickerStyle，
        // SwiftUI 还给我们提供了好几种有趣的方案，快去试试吧~
        .datePickerStyle(GraphicalDatePickerStyle())
    }

    @State private var date = Date()
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicDatePicker()
            RangeDatePicker()
            StylingDatePicker()
        }
        
    }
}
