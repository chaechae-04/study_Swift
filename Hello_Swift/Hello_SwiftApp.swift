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
            
            if showingSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation { self.showingSplash = false }
                        }
                    }
            } else {
                ContentView()
            }
            
        }
    }
}
