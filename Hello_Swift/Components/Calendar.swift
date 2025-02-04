//
//  Calendar.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MyCalendar: View {
    @State private var currenDate = Date()
    let geometry: GeometryProxy
    
    var body: some View {
        TabView {
            ForEach(-12...12, id: \.self) { month in
                if let date = Calendar.current.date(byAdding: .month, value: month, to: Date()) {
                    MonthView(date: date, geometry: geometry)
                        .tag(month)
                }
            }
        }
#if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: .never))
#else
        .tabViewStyle(.automatic)
#endif
    }
}

struct MonthView: View {
    let date: Date
    let calendar = Foundation.Calendar.current
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            Text(monthYearString)
                .font(.system(size: geometry.size.width / 15))
                .fontWeight(.bold)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(daysInMonth(), id: \.self) { day in
                    if let day = day {
                        Text("\(day)")
                            .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                            .padding(geometry.size.height / 70)
                    } else {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .padding(geometry.size.height / 70)
                    }
                }
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .top)
        
    }
    
    var monthYearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter.string(from: date)
    }
    
    func daysInMonth() -> [Int?] {
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)!
        let firstWeekday = calendar.component(.weekday, from: date)
        
        var days: [Int?] = Array(repeating: nil, count: firstWeekday - 1)
        days += (1...range.count).map { $0 }
        
        return days
    }
}

#Preview {
    MainView()
}
