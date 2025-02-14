//
//  TodoItem.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/12/25.
//

import SwiftUI

struct TodoItem: View {
    
    let todo: TodoModel
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: todo.complete ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.Colors.customBlack)
            }
            
            VStack(alignment: .leading) {
                Text(todo.title)
                    .strikethrough(todo.complete)
                Text(todo.category)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.1)
        .padding(.horizontal, ScreenSize.width * 0.05)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.Colors.customGray, lineWidth: 1)
        }
        .padding(.vertical, ScreenSize.height * 0.005)
    }
}

