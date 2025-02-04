//
//  Hello_SwiftApp.swift
//  Hello_Swift
//
//  Created by 이영수 on 1/2/25.
//

import SwiftUI

@main
struct Hello_SwiftApp: App {
    
    @State private var showingSplash: Bool = true
    @State private var splashOffset: CGFloat = 0
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                MainView()
                    .opacity(showingSplash ? 0 : 1)
                    .animation(.easeInOut(duration: 0.8), value: showingSplash)
                
                SplashView()
                    .offset(y: splashOffset)
                    .opacity(showingSplash ? 1 : 0)
                    .animation(.easeInOut(duration: 0.8), value: splashOffset)
                    .onAppear {
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
}
