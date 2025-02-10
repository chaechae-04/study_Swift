//
//  ContentView.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var navState = NavigationState()
    @State private var splashState: SplashState = .showing
    
    var body: some View {
        
        ZStack {
            mainContent
//          Preview 보기 편하게 주석처리 함
//            splashContent
        }
        .animation(.easeInOut(duration: 0.3), value: navState.currentScreen)
        .environmentObject(navState)
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
}

#Preview {
    ContentView()
}
