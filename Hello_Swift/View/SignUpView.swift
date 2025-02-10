//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var navState: NavigationState
    @StateObject private var userService = UserService()
    
    @State private var id: String = ""
    @State private var pw: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    
    @State private var currentTextField: String = ""
    
    @State private var birthday: String = "2000-1-1"
    @State private var selectedDate: Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? Date()
    
    @State private var showAlert: Bool = false
    @State private var errorType: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Group {
                    Button(action: {
                        navState.currentScreen = .logIn
                    }) {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.Colors.customBlack)
                            .fontWeight(.bold)
                    }
                    .frame(height: ScreenSize.height * 0.025)
                    .padding(.trailing, ScreenSize.width * 0.05)
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.05, alignment: .trailing)
                
                HStack {
                    Text("Sign Up View")
                        .font(.system(size: ScreenSize.width * 0.075, weight: .bold))
                        .padding(.leading, ScreenSize.width * 0.05)
                        .padding(.top, ScreenSize.height * 0.02)
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.125, alignment: .topLeading)
                .border(Color.Colors.customDarkBlue)
                
                Group {
                    VStack(spacing: ScreenSize.width * 0.05) {
                        TextField("ID", text: $id)
                            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
                            .padding(.leading, ScreenSize.width * 0.05)
                            .padding(.trailing, ScreenSize.width * 0.05)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(currentTextField == "id" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                            )
                            .onTapGesture { currentTextField = "id" }
                        
                        TextField("PW", text: $pw)
                            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
                            .padding(.leading, ScreenSize.width * 0.05)
                            .padding(.trailing, ScreenSize.width * 0.05)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(currentTextField == "pw" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                            )
                            .onTapGesture { currentTextField = "pw" }
                        
                        TextField("Email", text: $email)
                            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
                            .padding(.leading, ScreenSize.width * 0.05)
                            .padding(.trailing, ScreenSize.width * 0.05)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(currentTextField == "email" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                            )
                            .onTapGesture { currentTextField = "email" }
                        
                        TextField("Name", text: $name)
                            .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
                            .padding(.leading, ScreenSize.width * 0.05)
                            .padding(.trailing, ScreenSize.width * 0.05)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(currentTextField == "name" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                            )
                            .onTapGesture { currentTextField = "name" }
                        
                        Group {
                            DatePicker("Birthday", selection: $selectedDate, displayedComponents: [.date])
                                .datePickerStyle(.compact)
                                .frame(width: ScreenSize.width * 0.825)
                                .onChange(of: selectedDate) { _, newDate in
                                    let components = Calendar.current.dateComponents([.year, .month, .day], from: newDate)
                                    birthday = String(components.year ?? 2000) + "-" + String(components.month ?? 1) + "-" + String(components.day ?? 1)
                                }
                        }
                        .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.05)
                        .padding(.leading, ScreenSize.width * 0.05)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(currentTextField == "birthday" ? Color.Colors.customDarkBlue : Color.Colors.customGray, lineWidth: 1)
                        }
                    }
                    .padding(ScreenSize.width * 0.05)
                    
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.45, alignment: .topLeading)
                
                Group {
                    Button(action: {
                        print("ID : \(id)\nPW : \(pw)\nEmail : \(email)\nName : \(name)\nBirthDay : \(birthday)")
                        Task {
                            do {
                                let user = try await userService.signUp(id: id, email: email, password: pw, name: name, birthday: birthday)
                                
                                print("OK")
                                print(user)
                                
                                
                            } catch let error as UserError {
                                errorType = "SignUp Error"
                                showAlert = true
                                errorMessage = error.errorDescription ?? "회원가입 중 오류가 발생했어요."
                                
                            } catch {
                                errorType = "SignUp Error"
                                showAlert = true
                                errorMessage = "회원가입 중 오류가 발생했어요."
                            }
                        }
                    }) {
                        Text("Print")
                    }
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.25)
                .border(Color.Colors.customDarkBlue)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(errorType),
                        message: Text(errorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}

#Preview {
    SignUpView()
    //    ContentView()
}
