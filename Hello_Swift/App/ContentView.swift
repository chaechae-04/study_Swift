//
//  ContentView.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var navState = NavigationState()
    @StateObject private var alertState = AlertState()
    
    @State private var splashState: SplashState = .showing
    
    var body: some View {
        
        ZStack {
            mainContent
            splashContent
        }
        .onAppear { @MainActor in
            loginCheck()
        }
        .animation(.easeInOut(duration: 0.3), value: navState.currentScreen)
        .alert(isPresented: $alertState.isPresented) {
            alertState.buttonType == .single ?
            Alert(
                title: Text(alertState.title),
                message: Text(alertState.message),
                dismissButton: .default(Text("OK")) {
                    alertState.primaryAction?()
                }
            )
            :
            Alert(
                title: Text(alertState.title),
                message: Text(alertState.message),
                primaryButton: .destructive(Text("OK")) {
                    alertState.primaryAction?()
                },
                secondaryButton: .cancel(Text("NO")) {
                    alertState.secondaryAction?()
                }
                
            )
        }
        .environmentObject(navState)
        .environmentObject(alertState)
    }
    
    @ViewBuilder
    private var mainContent: some View {
        
        switch navState.currentScreen {
        case .logIn:
            LoginView()
                .transition(.opacity)
        case .signUp:
            SignUpView()
                .transition(.move(edge: .bottom))
        case .main:
            MainView()
                .transition(.opacity)
        case .todo:
            TodoView()
                .transition(.move(edge: .leading))
        case .newTodo:
            NewTodoItemView()
                .transition(.opacity)
        case .diary:
            DiaryView()
                .transition(.move(edge: .leading))
        }
    }
    
    private var splashContent: some View {
        SplashView()
            .opacity(splashState != .hidden ? 1 : 0)
            .task {
                await animateSplash()
            }
    }
    
    private func animateSplash() async {
        try? await Task.sleep(for: .seconds(3))
        withAnimation {
            splashState = .moving
        }
        try? await Task.sleep(for: .seconds(0.3))
        withAnimation {
            splashState = .hidden
        }
    }
    
    private func loginCheck() {
        if let _ = UserDefaultsManager.shared.getCurrentUser() {
            navState.currentScreen = .main
        } else {
            navState.currentScreen = .logIn
        }
    }
}

#Preview {
    ContentView()
}
 
