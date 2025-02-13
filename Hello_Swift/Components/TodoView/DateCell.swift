//
//  DateCell.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/11/25.
//

import SwiftUI

struct DateCell: View {
    
    let date: Date
    let isSelected: Bool
    
    /* 반응형 디자인으로 바꿔야함 */
    
    var body: some View {
        VStack {
            Text("\(date.formatted(.dateTime.day()))")
                .font(.title2)
                .fontWeight(.bold)
            Text("\(date.formatted(.dateTime.weekday(.abbreviated)))")
                .font(.caption)
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
        )
    }
}
