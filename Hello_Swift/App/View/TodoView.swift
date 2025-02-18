//
//  TodoView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import SwiftUI

struct TodoView: View {
    
    @EnvironmentObject var navState: NavigationState
    @EnvironmentObject var alertState: AlertState
    
    @State private var baseDate: Date = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1)) ?? Date()
    @State private var selectedDate: Date = Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1)) ?? Date()
    
    @State private var todos: [TodoModel] = []
    
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
                    DispatchQueue.main.async {
                        navState.currentScreen = .main
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ScreenSize.width * 0.15, height: ScreenSize.height * 0.025)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.Colors.customBlack)
                }
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
            
            /* MAIN */
            VStack {
                ScrollView {
                    
                    ForEach(todos) { todo in
                        TodoItem(todo: todo, onToggle: {
                            Task {
                                do {
                                    try await TodoService.shared.toggleComplete(id: todo.id, isComplete: !todo.complete)
                                    
                                    await loadTodos()
                                } catch {
                                    print("Toggle failed: \(error)")
                                }
                            }
                        }, deleteAction: {
                            alertState.isPresented = true
                            alertState.buttonType = .double
                            alertState.title = "Delete Todo Item"
                            alertState.message = "삭제하시겠습니까 ?"
                            
                            alertState.primaryAction = {
                                Task {
                                    do {
                                        try await TodoService.shared.deleteTodo(id: todo.id)
                                        
                                        await loadTodos()
                                    } catch {
                                        print("Delete Failed: \(error)")
                                    }
                                }
                            }
                        })
                    }
                    
                    /* 새로운 Todo 추가 */
                    HStack {
                        Text("Todo")
                        
                        Spacer()
                        
                        Button(action: {
                            DispatchQueue.main.async {
                                navState.currentScreen = .newTodo
                            }
                        }) {
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                                .frame(width: ScreenSize.width * 0.075)
                                .foregroundStyle(Color.Colors.customBlack)
                        }
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
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.6, alignment: .top)
            
            /* FOOTER */
            VStack(spacing: ScreenSize.height * 0.025) {
                Group {
                    YearMonthPicker(selectedDate: $selectedDate, date: $baseDate)
                }
                .frame(width: ScreenSize.width, alignment: .leading)
                .padding(.leading, ScreenSize.width * 0.05)
                CustomDateSlider(selectedDate: $selectedDate, baseDate: baseDate)
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.125)
            .onChange(of: selectedDate) { _, _ in
                Task {
                    await loadTodos()
                }
            }
        }
        .padding(.top, ScreenSize.height * 0.05)
        .frame(width: ScreenSize.width, height: ScreenSize.height, alignment: .top)
    }
    
    private func loadTodos() async {
        guard let userId = UserDefaultsManager.shared.getCurrentUser()?.id else { return }
        do {
            todos = try await TodoService.shared.fetchTodoByDate(userId: userId, date: selectedDate)
        } catch let error as TodoError {
            alertState.title = "Todo Error"
            alertState.isPresented = true
            alertState.message = error.errorDescription ?? "Todo Load 중 오류가 발생했어요."
            
        } catch {
            alertState.title = "Login Error"
            alertState.isPresented = true
            alertState.message = "Todo Load 중 오류가 발생했어요."
        }
    }
}

#Preview {
    ContentView()
}
