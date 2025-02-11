//
//  YearMonthPicker.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/11/25.
//

import SwiftUI

struct YearMonthPicker: View {
    
    @Binding var selectedDate: Date
    @Binding var date: Date
    
    @State private var year: Int
    @State private var month: Int
    
    @State private var isFirstLoad: Bool = true
    
    init(selectedDate: Binding<Date>, date: Binding<Date>) {
        self._selectedDate = selectedDate
        self._date = date
        let calendar = Calendar.current
        self._year = State(initialValue: calendar.component(.year, from: date.wrappedValue))
        self._month = State(initialValue: calendar.component(.month, from: date.wrappedValue))
    }

    var body: some View {
        HStack {
            Picker("Year", selection: $year) {
                let currentYear = Calendar.current.component(.year, from: Date())
                ForEach((2025...(currentYear + 5)), id: \.self) { year in
                    Text(String(format: "%d년", year)).tag(year)
                }
            }
            .accentColor(Color.Colors.customBlack)
            Picker("Month", selection: $month) {
                ForEach((1...12), id: \.self) { month in
                    Text("\(month)월").tag(month)
                }
            }
            .accentColor(Color.Colors.customBlack)
        }
        .onAppear {
            let calendar = Calendar.current
            year = calendar.component(.year, from: Date())
            month = calendar.component(.month, from: Date())
        }
        .onChange(of: year) { updateDate() }
        .onChange(of: month) { updateDate() }
    }
    
    private func updateDate() {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        date = Calendar.current.date(from: components) ?? date
//        selectedDate = date
    }
}

//#Preview {
//    YearMonthPicker()
//}
