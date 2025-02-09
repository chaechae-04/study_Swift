//
//  StartView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var navState: NavigationState
    @StateObject private var userService = UserService()
    
    @State private var errorType: String = ""
    @State private var errorMessage: String = ""
    
    @State private var id: String = ""
    @State private var pw: String = ""
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center) {
                
                /* Icon */
                Group {
                    Text("icon")
                }
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.1)
                .border(.red)
                
                /* ID, PW Text Field */
                Group {
                    Text("login")
                }
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.1)
                .border(.red)
                
                Group {
                    VStack(spacing: 0) {
                        HStack() {
                            TextField("ID", text: $id)
                                .font(.system(size: UIScreen.main.bounds.width * 0.06, weight: .bold))
                                .padding(.leading, UIScreen.main.bounds.width * 0.05)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.1, alignment: .leading)
                        .border(.blue)
                        HStack {
                            TextField("PW", text: $pw)
                                .font(.system(size: UIScreen.main.bounds.width * 0.06, weight: .bold))
                                .padding(.leading, UIScreen.main.bounds.width * 0.05)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.1, alignment: .leading)
                        .border(.blue)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(errorType),
                            message: Text(errorMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.2)
                .background(Color.Colors.customWhite)
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
                                
                                navState.currentScreen = .main
                                
                            } catch let error as UserError {
                                errorType = "Login Error"
                                showAlert = true
                                errorMessage = error.errorDescription ?? "로그인 중 오류가 발생했어요."
                                
                            } catch {
                                errorType = "Login Error"
                                showAlert = true
                                errorMessage = "로그인 중 오류가 발생했어요."
                            }
                        }
                    } label: {
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                            Text("Login")
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.0875)
                    .border(.blue)
                    
                    /* SignUp */
                    Button(action: {
                        navState.currentScreen = .signUp
                    }) {
                        ZStack {
                            Color.clear
                                .contentShape(Rectangle())
                            Text("SignUp")
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.0875)
                    //                        .fullScreenCover(isPresented: $showSignUp) {
                    //                            SignUpView()
                    //                        }
                    .border(.blue)
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.175)
                .background(Color.Colors.customWhite)
                .foregroundStyle(Color.Colors.customBlack)
                .border(.red)
                
                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .padding(.top, UIScreen.main.bounds.height * 0.125)
            .background(Color.Colors.customGray)
            .border(.black)
        }
    }
}

//#Preview {
//    LoginView()
//}
