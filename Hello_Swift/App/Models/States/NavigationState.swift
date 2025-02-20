//
//  NavigationState.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation

class NavigationState: ObservableObject {
    @Published var currentScreen: ScreenState = .logIn
}

