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
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                MainView()
                    .opacity(showingSplash ? 0 : 1)
                    .animation(.easeInOut(duration: 0.8), value: showingSplash)
                
                SplashView()
                    .opacity(showingSplash ? 1 : 0)
                    .animation(.easeInOut(duration: 0.8), value: showingSplash)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { showingSplash = false }
                    }
            }
            
        }
    }
}
