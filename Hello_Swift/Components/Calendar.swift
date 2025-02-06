//
//  Calendar.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MyCalendar: View {
    @State private var currentDate = {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.year = (components.year ?? 0) + 1
        return Calendar.current.date(from: components) ?? Date()
    }()
    let geometry: GeometryProxy
    
    var body: some View {
        TabView {
            ForEach(-12...12, id: \.self) { month in
                if let date = Calendar.current.date(byAdding: .month, value: month, to: currentDate) {
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
        .padding()
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
                
                ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { day in
                    Text(day)
                        .foregroundStyle(day.uppercased() == "SUN" ? Color("Colors/customDarkRed") : day.uppercased() == "SAT" ? Color("Colors/customDarkBlue") : .black)
                        .font(.system(size: geometry.size.width / 30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                
                ForEach(daysInMonth().indices, id: \.self) { index in
                    if let day = daysInMonth()[index] {
                        Text("\(day)")
                            .foregroundStyle((index % 7 == 0) ? Color("Colors/customDarkRed") : (index % 7 == 6) ? Color("Colors/customDarkBlue") : .black)
                            .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                            .padding(geometry.size.height / 80)
                    } else {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .padding(geometry.size.height / 80)
                    }
                }
            }
        }
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height / 2, alignment: .top)
//        .border(.black)
        
    }
    
    var monthYearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM, yyyy"
        return formatter.string(from: date)
    }
    
    func daysInMonth() -> [Int?] {
        let components = calendar.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = calendar.date(from: components)!
        
        let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth)!
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        var days: [Int?] = Array(repeating: nil, count: firstWeekday - 1)
        days += (1...range.count).map { $0 }
        
        return days
    }
}

#Preview {
    MainView()
}
