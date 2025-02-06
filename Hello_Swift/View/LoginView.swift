//
//  StartView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var userService = UserService()
    
    @State private var showSignUp: Bool = false
    @State private var showMain: Bool = true
    
    @State private var errorMessage: String = ""
    
    @State private var id: String = ""
    @State private var pw: String = ""
    
    var body: some View {
        if showMain {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    
                    /* Icon */
                    Group {
                        Text("icon")
                    }
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.1)
                    .border(.red)
                    
                    /* ID, PW Text Field */
                    Group {
                        Text("login")
                    }
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.1)
                    .border(.red)
                    
                    Group {
                        VStack(spacing: 0) {
                            HStack() {
                                TextField("ID", text: $id)
                                    .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                                    .padding(.leading, geometry.size.width * 0.05)
                            }
                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.1, alignment: .leading)
                            .background(.white)
                            .border(.blue)
                            HStack {
                                TextField("PW", text: $pw)
                                    .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                                    .padding(.leading, geometry.size.width * 0.05)
                            }
                            .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.1, alignment: .leading)
                            .border(.blue)
                        }
                    }
                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.2)
                    .border(.red)
                    
                    /* Login, SignUp Button */
                    VStack(spacing: 0) {
                        /* Login */
                        Button {
                            Task {
                                do {
                                    let user = try await userService.signIn(id: id, password: pw)
                                    UserDefaultsManager.shared.saveUser(user)
                                    showMain = false
                                } catch let error as UserError {
                                    print("Error: \(error)")
                                    errorMessage = error.errorDescription ?? "로그인 중 오류가 발생했어요."
                                } catch {
                                    print("Error: \(error)")
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
                        .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.0875)
                        .border(.blue)
                        
                        /* SignUp */
                        Button(action: {
                            showSignUp = true
                        }) {
                            ZStack {
                                Color.clear
                                    .contentShape(Rectangle())
                                Text("SignUp")
                            }
                        }
                        .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.0875)
                        .fullScreenCover(isPresented: $showSignUp) {
                            SignUpView()
                        }
                        .border(.blue)
                        
                    }
                    .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.175)
                    .border(.red)
                    
                    Spacer()
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .padding(.top, geometry.size.height * 0.125)
                .border(.black)
            }
        } else {
            MainView()
                .transition(.opacity.animation(.easeInOut(duration: 0.8)))
        }
    }
}

//#Preview {
//    LoginView()
//}
