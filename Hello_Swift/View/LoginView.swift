//
//  StartView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var navState: NavigationState
    @EnvironmentObject var alertState: AlertState
    @StateObject private var userService = UserService()
    
    @State private var id: String = ""
    @State private var pw: String = ""
    
    @State private var isSecured: Bool = true
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center) {
                
                /* Icon */
                Group {
                    Text("icon")
                }
                .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.1)
                .border(.red)
                
                /* ID, PW Text Field */
                Group {
                    Text("login")
                }
                .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.1)
                .border(.red)
                
                Group {
                    VStack(spacing: 0) {
                        HStack() {
                            TextField("ID", text: $id)
                                .font(.system(size: ScreenSize.width * 0.06, weight: .bold))
                                .padding(.leading, ScreenSize.width * 0.05)
                        }
                        .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.1, alignment: .leading)
                        .border(.blue)
                        HStack {
                            if isSecured {
                                SecureField("PW", text: $pw)
                                    .font(.system(size: ScreenSize.width * 0.06, weight: .bold))
                                    .padding(.leading, ScreenSize.width * 0.05)
                            } else {
                                TextField("PW", text: $pw)
                                    .font(.system(size: ScreenSize.width * 0.06, weight: .bold))
                                    .padding(.leading, ScreenSize.width * 0.05)
                            }
                            
                            Button(action: { isSecured.toggle() }) {
                                Image(systemName: isSecured ? "eye.slash" : "eye")
                                    .padding(.trailing, ScreenSize.width * 0.05)
                                    .fontWeight(.bold)
                            }
                        }
                        .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.1, alignment: .leading)
                        .border(.blue)
                    }
                }
                .frame(width: ScreenSize.width * 0.85, height: ScreenSize.height * 0.2)
                .foregroundStyle(Color.Colors.customBlack)
                .border(.red)
                
                /* Login, SignUp Button */
                VStack(spacing: 0) {
                    /* Login */
                    Button {
                        Task {
                            do {
                                let user = try await userService.signIn(id: id, password: pw)
                                UserDefaultsManager.shared.saveUser(user)
                                
                                alertState.title = "Welcome !"
                                alertState.isPresented = true
                                alertState.message = "환영합니다 !"
                                
                                alertState.primaryAction = {
                                    DispatchQueue.main.async {
                                        navState.currentScreen = .main
                                    }
                                }
                                
                            } catch let error as UserError {
                                alertState.title = "Login Error"
                                alertState.isPresented = true
                                alertState.message = error.errorDescription ?? "로그인 중 오류가 발생했어요."
                                
                            } catch {
                                alertState.title = "Login Error"
                                alertState.isPresented = true
                                alertState.message = "로그인 중 오류가 발생했어요."
                            }
                        }
                    } label: {
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                            Text("Login")
                        }
                    }
                    .frame(width: ScreenSize.width * 0.55, height: ScreenSize.height * 0.0875)
                    .border(.blue)
                    
                    /* SignUp */
                    Button(action: {
                        DispatchQueue.main.async {
                            navState.currentScreen = .signUp
                        }
                    }) {
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                            Text("SignUp")
                        }
                    }
                    .frame(width: ScreenSize.width * 0.55, height: ScreenSize.height * 0.0875)
                    .border(.blue)
                    
                }
                .frame(width: ScreenSize.width * 0.55, height: ScreenSize.height * 0.175)
                .foregroundStyle(Color.Colors.customBlack)
                .border(.red)
                
                Spacer()
                
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height)
            .padding(.top, ScreenSize.height * 0.125)
            .border(.black)
        }
    }
}

#Preview {
    LoginView()
}
