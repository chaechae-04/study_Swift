//
//  NewTodoItemView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/15/25.
//

import SwiftUI

struct NewTodoItemView: View {
    
    @EnvironmentObject var navState: NavigationState
    @EnvironmentObject var alertState: AlertState
    @EnvironmentObject var todoDateState: TodoDateState
    @StateObject private var todoService = TodoService()
    
    @State private var currentField: String = ""
    
    @State private var currentDate: Date = Date()
    let formatter = DateFormatter()
    @State private var dateTime: String = ""
    
    @State private var category: String = ""
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var complete: Bool = false
    
    var body: some View {
        VStack(spacing: ScreenSize.height * 0.025) {
            
            Group {
                Button(action: {
                    DispatchQueue.main.async {
                        navState.currentScreen = .todo
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ScreenSize.width * 0.15)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.Colors.customBlack)
                }
            }
            .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.025, alignment: .trailing)
            .padding(.top, ScreenSize.height * 0.025)
            
            HStack {
                
                DatePicker("", selection: $currentDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .frame(width: ScreenSize.width * 0.3)
                    .onChange(of: currentDate) { _, newDate in
                        let components = Calendar.current.dateComponents([.year, .month, .day], from: newDate)
                        dateTime = String(components.year ?? 2000) + "-" + String(components.month ?? 1) + "-" + String(components.day ?? 1) + " 01:01"
                    }
                
                Spacer()
                
                Text("\(UserDefaultsManager.shared.getCurrentUser()?.id ?? "userEmpty")")
            }
            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
            
            HStack {
                TextField("Category", text: $category)
                    .frame(width: ScreenSize.width * 0.7, height: ScreenSize.height * 0.05)
                    .padding(.leading, ScreenSize.width * 0.05)
                    .padding(.trailing, ScreenSize.width * 0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(currentField == "category" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                    )
                    .onTapGesture { currentField = "category" }
                
                Image(systemName: category.isEmpty ? "exclamationmark.bubble" : "checkmark.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenSize.width * 0.075)
                    .foregroundStyle(category.isEmpty ? Color.Colors.customDarkRed : Color.Colors.customDarkBlue)
            }
            .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.075, alignment: .leading)
            
            HStack {
                TextField("Title", text: $title)
                    .frame(width: ScreenSize.width * 0.7, height: ScreenSize.height * 0.05)
                    .padding(.leading, ScreenSize.width * 0.05)
                    .padding(.trailing, ScreenSize.width * 0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(currentField == "title" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                    )
                    .onTapGesture { currentField = "title" }
                
                Image(systemName: title.isEmpty ? "exclamationmark.bubble" : "checkmark.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenSize.width * 0.075)
                    .foregroundStyle(title.isEmpty ? Color.Colors.customDarkRed : Color.Colors.customDarkBlue)
            }
            .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.075, alignment: .leading)
            
            HStack {
                TextField("Content", text: $content)
                    .frame(width: ScreenSize.width * 0.7, height: ScreenSize.height * 0.15)
                    .padding(.leading, ScreenSize.width * 0.05)
                    .padding(.trailing, ScreenSize.width * 0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(currentField == "content" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                    )
                    .onTapGesture { currentField = "content" }
                
                Image(systemName: content.isEmpty ? "exclamationmark.bubble" : "checkmark.bubble")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenSize.width * 0.075)
                    .foregroundStyle(content.isEmpty ? Color.Colors.customDarkRed : Color.Colors.customDarkBlue)
            }
            .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.225, alignment: .leading)
            
            
            /** Preview */
            Text("Preview")
                .frame(width: ScreenSize.width * 0.75, alignment: .leading)
                .font(.system(size: ScreenSize.width * 0.05, weight: .bold))
            
            HStack {
                Button(action: {
                    complete.toggle()
                }) {
                    Image(systemName: complete ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(Color.Colors.customBlack)
                }
                
                VStack(alignment: .leading) {
                    Text(title.isEmpty ? "Title" : title)
                        .strikethrough(complete)
                    Text(category.isEmpty ? "Category" : category)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "info.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ScreenSize.width * 0.075)
                        .foregroundColor(Color.Colors.customBlack)
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "trash.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ScreenSize.width * 0.075)
                        .foregroundColor(Color.Colors.customDarkRed)
                }
            }
            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.1)
            .padding(.horizontal, ScreenSize.width * 0.05)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.Colors.customGray, lineWidth: 1)
            }
            
            Spacer()
            
            Group {
                Button(action: {
                    
                    Task {
                        do {
                            try await todoService.validateTodoItem(userId: UserDefaultsManager.shared.getCurrentUser()?.id ?? "", dateTime: dateTime, category: category, title: title, content: content, complete: false)
                            
                            alertState.title = "Complete !"
                            alertState.isPresented = true
                            alertState.message = "작성이 완료되었습니다 !"
                            
                            alertState.primaryAction = {
                                DispatchQueue.main.async {
                                    navState.currentScreen = .todo
                                }
                            }
                            
                        } catch let error as TodoError {
                            alertState.title = "Error"
                            alertState.isPresented = true
                            alertState.message = "Error: \(error.errorDescription ?? "Error !")"
                        } catch {
                            alertState.title = "Error"
                            alertState.isPresented = true
                            alertState.message = "Error: Ather Error"
                        }
                    }
                    
                }) {
                    HStack {
                        Text("Create Todo")
                        
                        Image(systemName: "rectangle.stack.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: ScreenSize.width * 0.1)
                    }
                    .foregroundStyle(Color.Colors.customDarkBlue)
                }
            }
            .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.075)
            .padding(.bottom, ScreenSize.height * 0.025)
            
        }
        .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.9, alignment: .top)
        .onAppear {
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            currentDate = todoDateState.selectedDate ?? Date()
            dateTime = formatter.string(from: currentDate)
        }
    }
}

#Preview {
    ContentView()
}
