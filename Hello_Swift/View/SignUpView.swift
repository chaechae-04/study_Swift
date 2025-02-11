//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var navState: NavigationState
    @EnvironmentObject var alertState: AlertState
    @StateObject private var userService = UserService()
    
    @State private var id: String = ""
    @State private var pw: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    
    @State private var currentTextField: String = ""
    
    @State private var birthday: String = "2000-1-1"
    @State private var selectedDate: Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1)) ?? Date()
    
    @State private var isSecured: Bool = true
    
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
                        
                        HStack {
                            if isSecured {
                                SecureField("PW", text: $pw)
                            } else {
                                TextField("PW", text: $pw)
                            }
                            
                            Button(action: { isSecured.toggle() }) {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
                                    .fontWeight(.bold)
                                    .foregroundStyle(currentTextField == "pw" ? Color.Colors.customBlack : Color.Colors.customGray)
                            }
                        }
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
                                .stroke(Color.Colors.customBlack, lineWidth: 1)
                        }
                    }
                    .padding(ScreenSize.width * 0.05)
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.45, alignment: .topLeading)
                
                VStack(alignment: .trailing) {
                    
                    Color.clear
                        .frame(width: ScreenSize.width * 0.9, height: ScreenSize.height * 0.175)
                        .overlay {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: ScreenSize.width * 0.2)
                                    .padding(.leading, ScreenSize.width * 0.05)
                                
                                VStack(spacing: 0) {
                                    HStack(spacing: 0) {
                                        Text("\(id.isEmpty ? "ID" : id)")
                                            .frame(width: ScreenSize.width * 0.3, height: ScreenSize.height * 0.05, alignment: .leading)
                                        
                                        Text("\(birthday.isEmpty ? "Birthday" : birthday)")
                                            .frame(width: ScreenSize.width * 0.225, height: ScreenSize.height * 0.05, alignment: .leading)
                                    }
                                    .frame(width: ScreenSize.width * 0.525, height: ScreenSize.height * 0.05, alignment: .leading)
                                    .padding(.leading, ScreenSize.width * 0.075)
                                    
                                    HStack {
                                        Text("\(email.isEmpty ? "Email" : email)")
                                    }
                                    .frame(width: ScreenSize.width * 0.525, height: ScreenSize.height * 0.05, alignment: .leading)
                                    .padding(.leading, ScreenSize.width * 0.075)
                                    
                                    HStack {
                                        Text("\(name.isEmpty ? "Name" : name)")
                                    }
                                    .frame(width: ScreenSize.width * 0.525, height: ScreenSize.height * 0.05, alignment: .trailing)
                                    .padding(.trailing, ScreenSize.width * 0.075)
                                    
                                }
                                .frame(width: ScreenSize.width * 0.6, height: ScreenSize.height * 0.175)
                            }
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.Colors.customBlack, lineWidth: 1)
                        }
                        .padding(.trailing, ScreenSize.height * 0.005)
                    
                    Button(action: {
                        print("ID : \(id)\nPW : \(pw)\nEmail : \(email)\nName : \(name)\nBirthDay : \(birthday)")
                        Task {
                            do {
                                let _ = try await userService.signUp(id: id, email: email, password: pw, name: name, birthday: birthday)
                                
                                alertState.title = "Welcome !"
                                alertState.isPresented = true
                                alertState.message = "회원가입에 성공하였습니다 !"
                                
                                alertState.primaryAction = {
                                    navState.currentScreen = .logIn
                                }
                                
                            } catch let error as UserError {
                                alertState.title = "SignUp Error"
                                alertState.isPresented = true
                                alertState.message = error.errorDescription ?? "회원가입 중 오류가 발생했어요."
                                
                                alertState.primaryAction = {}
                                
                            } catch {
                                alertState.title = "SignUp Error"
                                alertState.isPresented = true
                                alertState.message = "회원가입 중 오류가 발생했어요."
                                
                                alertState.primaryAction = {}
                            }
                        }
                    }) {
                        Text("OK")
                    }
                    .padding(.trailing, ScreenSize.width * 0.1)
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.25)
                .border(Color.Colors.customDarkBlue)
            }
        }
    }
}

#Preview {
    SignUpView()
    //    ContentView()
}
