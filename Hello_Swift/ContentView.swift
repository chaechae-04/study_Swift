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
            splashContent
        }
        .environmentObject(navState)
    }
    
    @ViewBuilder
    private var mainContent: some View {
        
        switch navState.currentScreen {
        case .logIn:
            LoginView()
        case .signUp:
            SignUpView()
        case .main:
            MainView()
        case .todo:
            TodoView()
        }
        
    }
    
    private var splashContent: some View {
        SplashView()
            .transition(.move(edge: .bottom))
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
