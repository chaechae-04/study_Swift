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
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        TabView {
            ForEach(-12...12, id: \.self) { month in
                if let date = Calendar.current.date(byAdding: .month, value: month, to: currentDate) {
                    MonthView(date: date, width: width, height: height)
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
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Text(monthYearString)
                .font(.system(size: width * 0.06, weight: .bold))
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                
                ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { day in
                    Text(day)
                        .foregroundStyle(day.uppercased() == "SUN" ? Color.Colors.customDarkRed : day.uppercased() == "SAT" ? Color.Colors.customDarkBlue : Color.Colors.customBlack)
                        .font(.system(size: width * 0.04, weight: .bold))
                        .frame(maxWidth: .infinity)
                }
                
                ForEach(daysInMonth().indices, id: \.self) { index in
                    if let day = daysInMonth()[index] {
                        Text("\(day)")
                            .foregroundStyle((index % 7 == 0) ? Color.Colors.customDarkRed : (index % 7 == 6) ? Color.Colors.customDarkBlue : Color.Colors.customBlack)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .fontWeight(.bold)
                            .padding(.top, height * 0.0225)
                            .padding(.bottom, height * 0.0225)
                    } else {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .padding(.top, height * 0.0225)
                            .padding(.bottom, height * 0.0225)
                    }
                }
            }
        }
        .frame(width: width * 0.9, height: height * 0.9, alignment: .top)
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
    ContentView()
}
