//
//  CustomDateSlider.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/11/25.
//

import SwiftUI

struct CustomDateSlider: View {
    
    @Binding var selectedDate: Date
    let baseDate: Date
    
    @State private var scrollOffset: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    /* 반응형 디자인으로 바꿔야함 */
    
    private let cellWidth: CGFloat = 80
    private let cellSpacing: CGFloat = 10
    
    @State private var isFirstLoad: Bool = true
    
    init(selectedDate: Binding<Date>, baseDate: Date) {
        self._selectedDate = selectedDate
        self.baseDate = baseDate
    }
    
    private var daysInMonth: [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: baseDate)!
        return range.compactMap { day in
            calendar.date(from: calendar.dateComponents([.year, .month, .day], from: baseDate.addingTimeInterval(TimeInterval(86400 * (day - 1)))))
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { proxy in
                    HStack(spacing: cellSpacing) {
                        ForEach(daysInMonth, id: \.self) { date in
                            DateCell(date: date, isSelected: Calendar.current.isDate(date, inSameDayAs: selectedDate))
                                .frame(width: cellWidth)
                                .id(Calendar.current.component(.day, from: date))
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedDate = date
                                    }
                                }
                        }
                    }
                    .onAppear {
                        if isFirstLoad {
                            isFirstLoad = false
                            selectedDate = Date()
                            let selectedDay = Calendar.current.component(.day, from: selectedDate)
                            proxy.scrollTo(selectedDay, anchor: .center)
                        }
                    }
                }
                .offset(x: dragOffset)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let velocity = value.predictedEndTranslation.width
                            let targetIndex = -Int(round((scrollOffset + velocity) / (cellWidth + cellSpacing)))
                            let targetDate = Calendar.current.date(byAdding: .day, value: targetIndex, to: Date()) ?? Date()
                            
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                selectedDate = targetDate
                            }
                        }
                )
            }
            .onAppear {
                if isFirstLoad {
                    selectedDate = Date()
                    isFirstLoad = false
                }
            }
        }
    }
}

extension DateFormatter {
    static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
}
