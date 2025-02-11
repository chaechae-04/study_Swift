//
//  TodoView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import SwiftUI

struct TodoView: View {
    
    @EnvironmentObject var navState: NavigationState
    @State private var baseDate: Date = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1)) ?? Date()
    @State private var selectedDate: Date = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1)) ?? Date()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack {
            /* HEADER */
            HStack {
                
                Text(dateFormatter.string(from: selectedDate))
                    .padding(.leading, ScreenSize.width * 0.05)
                
                Spacer()
                
                Button(action: {
                    navState.currentScreen = .main
                }) {
                    Image(systemName: "chevron.forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ScreenSize.width * 0.15, height: ScreenSize.height * 0.025)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.Colors.customBlack)
                }
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
            .border(.red)
            
            /* MAIN */
            VStack {
                Text("Todo")
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.625)
            .border(.blue)
            
            /* FOOTER */
            VStack(spacing: ScreenSize.height * 0.025) {
                Group {
                    YearMonthPicker(date: $baseDate)
                }
                .frame(width: ScreenSize.width, alignment: .leading)
                .padding(.leading, ScreenSize.width * 0.05)
                CustomDateSlider(selectedDate: $selectedDate, baseDate: baseDate)
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.125)
        }
        .padding(.top, ScreenSize.height * 0.05)
        .frame(width: ScreenSize.width, height: ScreenSize.height, alignment: .top)
    }
}

#Preview {
    TodoView()
}
