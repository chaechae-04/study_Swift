//
//  TodoService.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import Combine

class TodoService: ObservableObject {
    @Published var crrentUser: UserModel?
    
    static let shared = TodoService()
    private let db = Firestore.firestore()
    
    /** userId, Date 조회 */
    func fetchTodoByDate(userId: String, date: Date) async throws -> [TodoModel] {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let snapshot = try await db.collection("todos")
            .whereField("userId", isEqualTo: userId)
            .whereField("dateTime", isGreaterThanOrEqualTo: Timestamp(date: startOfDay))
            .whereField("dateTime", isLessThan: Timestamp(date: endOfDay))
            .getDocuments()
        
        return try snapshot.documents.map { try $0.data(as: TodoModel.self) }
    }
    
    /** 유저의 전체 Todo, Categories 조회 */
    func fechAllUserTodos(userId: String) async throws -> ([TodoModel], [String]) {
        let snapshot = try await db.collection("todos")
            .whereField("userId", isEqualTo: userId)
            .getDocuments()
        
        let todos = try snapshot.documents.map { try $0.data(as: TodoModel.self) }
        let categories = Array(Set(todos.map { $0.category })).sorted()
        
        return (todos, categories)
    }
    
    /** Todo 저장 */
    func saveTodo(_ todo: TodoModel) async throws {
        try await db.collection("todos").document(todo.id).setData([
            "id": todo.id,
            "userId": todo.userId,
            "category": todo.category,
            "dateTime": todo.dateTime,
            "title": todo.title,
            "content": todo.content,
            "complete": todo.complete
        ])
    }
    
    /** Todo 삭제 */
    func deleteTodo(id: String) async throws {
        try await db.collection("todos").document(id).delete()
    }
    
    /** 완료상태 변경 ( id : todo.UUID , isComplete : true or false ) */
    func toggleComplete(id: String, isComplete: Bool) async throws {
        try await db.collection("todos").document(id).updateData([
            "complete": isComplete
        ])
    }
}
