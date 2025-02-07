//
//  Hello_SwiftApp.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Hello_SwiftApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var isLoggedIn: Bool = false
    @State private var showingSplash: Bool = true
    @State private var splashOffset: CGFloat = 0
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                Group {
                    if isLoggedIn {
                        MainView()
                    } else {
                        LoginView()
                    }
                }
                .opacity(showingSplash ? 0 : 1)
                .animation(.easeInOut(duration: 0.8), value: showingSplash)
                
                SplashView()
                    .offset(y: splashOffset)
                    .opacity(showingSplash ? 1 : 0)
                    .animation(.easeInOut(duration: 0.8), value: splashOffset)
                    .onAppear {
                        checkLoginStatus()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeOut(duration: 0.5)) { splashOffset = UIScreen.main.bounds.height * 0.12
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.spring()) {
                                        splashOffset = -UIScreen.main.bounds.height
                                        showingSplash = false
                                    }
                                }
                            }
                        }
                    }
            }
        }
    }
    
    private func checkLoginStatus() {
        isLoggedIn = UserDefaultsManager.shared.getCurrentUser() != nil
    }
    
}
