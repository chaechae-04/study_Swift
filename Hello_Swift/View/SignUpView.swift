//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
        Text("Go to Login View")
            .onTapGesture {
                navState.currentScreen = .logIn
            }
    }
}

//#Preview {
//    LoginView()
//}
