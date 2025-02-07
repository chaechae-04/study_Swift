//
//  PieChart.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct PieChart: View {
    
    @State private var selectedCategory: String?
    
    private let completionRate: Double = 75           // 초기값 설정
    @State private var currentRate: Double = 75       // 초기값 : completionRate
    
    let width: CGFloat
    let height: CGFloat
    
    /* TEMP */
    let categories = [
        ("카테고리1", 0.3, Color.green),
        ("공부", 0.5, Color.blue),
        ("카테고리3", 0.2, Color.orange)
    ]
    
    private func animateToRate(_ category: (String, Double, Color)) {
        withAnimation(.spring(response: 0.6)) {
            currentRate = category.1 * 100
        }
    }
    
    var body: some View {
        ZStack {
            
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        selectedCategory = nil
                    }
                }
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: width / 2, y: height / 2),
                    radius: min(width, height) * 0.35,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 270),
                    clockwise: false
                )
            }
            .stroke(Color.gray.opacity(0.3), lineWidth: min(width, height) * 0.125)
            
            let angles = categories.reduce(into: [(Double, Double)]()) { result, category in
                let start = result.last?.1 ?? -90
                let categoryCompletion = category.1 * completionRate / 100.0
                let end = start + (categoryCompletion * 360)
                result.append((start, end))
            }
            
            ForEach(Array(zip(categories, angles).enumerated()), id: \.0) { index, data in
                let (category, angle) = data
                Path { path in
                    path.addArc(
                        center: CGPoint(x: width / 2, y: height / 2),
                        radius: min(width, height) * 0.35,
                        startAngle: Angle(degrees: angle.0),
                        endAngle: Angle(degrees: angle.1),
                        clockwise: false
                    )
                }
                .stroke(category.2, lineWidth: min(width, height) * 0.125)
                .scaleEffect(category.0 == selectedCategory ? 1.1 : 1.0)
                .opacity(selectedCategory == nil || category.0 == selectedCategory ? 1.0 : 0.5)
                .animation(.spring(response: 0.3), value: selectedCategory)
                .onTapGesture {
                    withAnimation {
                        selectedCategory = selectedCategory == category.0 ? nil : category.0
                        animateToRate(category)
                    }
                }
            }
            
            VStack {
                Text(String(format: (selectedCategory == nil ? completionRate : completionRate * currentRate / 100).truncatingRemainder(dividingBy: 1) == 0 ? "%.0f%%" : "%.1f%%", (selectedCategory == nil ? completionRate : completionRate * currentRate / 100)))
                    .font(.system(size: min(width, height) * 0.125, weight: .bold))
                if let selected = selectedCategory {
                    Text(selected)
                        .font(.system(size: min(width, height) * 0.125, weight: .bold))
                        .transition(.scale.combined(with: .opacity))
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = nil
                            }
                        }
                }
            }
            .foregroundStyle(Color.Colors.customBlack)
        }
    }
}

#Preview {
    MainView()
}
