//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    @State private var id: String = ""
    @State private var pw: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    
    @State private var currentTextField: String = ""
    
    @State private var birthday: [String] = ["", "", ""]
    
    
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
                     
                        HStack {
                            Text("birthday")
                        }
                        .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.05)
                        .padding(.leading, ScreenSize.width * 0.05)
                        .padding(.trailing, ScreenSize.width * 0.05)
                        .border(.black)
                        
                    }
                    .padding(ScreenSize.width * 0.05)
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.45, alignment: .topLeading)
                .border(Color.Colors.customDarkRed)
                
                Group {
                    Text("Footer")
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
