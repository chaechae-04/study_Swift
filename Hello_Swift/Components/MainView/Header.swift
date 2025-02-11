//
//  Header.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct Header: View {
    
    @EnvironmentObject var navState: NavigationState
    @StateObject var sheetAlertState: AlertState = AlertState()
    
    @State private var iconName: String = "sun.haze"
    @State private var isIconActive: Bool = false
    @State private var showSideMenu: Bool = false
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            /* 아이콘 */
            Button(action: {
                isIconActive.toggle()
                if isIconActive {
                    iconName = "moon.haze"
                } else {
                    iconName = "sun.haze"
                }
                
            }) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.3, height: height * 0.65)
                
            }
            Spacer()
            
            HStack(spacing: 0) {
                Text(UserDefaultsManager.shared.getCurrentUser()?.name ?? "User")
                    .font(.system(size: width * 0.065, weight: .bold))
                    .frame(alignment: .trailing)
                    .padding(.top, height * 0.08)
                    .padding(.trailing, 0)
                /* 프로필 */
                Button(action: {
                    showSideMenu.toggle()
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.2, height: height * 0.65)
                        .padding(.leading, 0)
                }
            }
        }
        .foregroundStyle(Color.Colors.customBlack)
        .padding(.top, height * 0.15)
        .sheet(isPresented: $showSideMenu) {
            VStack {
                Text("프로필")
                
                Button(action: {
                    sheetAlertState.buttonType = .double
                    
                    sheetAlertState.title = "Logout"
                    sheetAlertState.isPresented = true
                    sheetAlertState.message = "정말 로그아웃 하시겠습니까 ?"
                    
                    sheetAlertState.primaryAction = {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showSideMenu = false
                        }
                        navState.currentScreen = .logIn
                        UserDefaultsManager.shared.clearUser()
                    }
                }) {
                    Text("Logout")
                        .foregroundColor(Color.Colors.customDarkRed)
                }
                Spacer()
            }
            .frame(width: width)
            .alert(isPresented: $sheetAlertState.isPresented) {
                Alert(
                    title: Text(sheetAlertState.title),
                    message: Text(sheetAlertState.message),
                    primaryButton: .destructive(Text("예")) {
                        sheetAlertState.primaryAction?()
                    },
                    secondaryButton: .cancel(Text("아니요")) {
                        sheetAlertState.secondaryAction?()
                    }
                )
            }
        }
    }
}

#Preview {
//    MainView()
    ContentView()
}
