//
//  TodoState.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/20/25.
//

import Foundation

class TodoState: ObservableObject {
    @Published var selectedTodo: TodoModel?
}

class TodoDateState: ObservableObject {
    @Published var selectedDate: Date?
}
