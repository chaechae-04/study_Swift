//
//  ViewError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import Foundation

enum ViewError: LocalizedError {
    
    case splashView
    case loginView
    case signUpView
    case mainView
    case todoView
    case diaryView
    
    var errorDescription: String? {
        switch self {
        case .splashView:
            return "Error: Splash View"
        case .loginView:
            return "Error: Login View"
        case .signUpView:
            return "Error: Sign Up View"
        case .mainView:
            return "Error: Main View"
        case .todoView:
            return "Error: Todo View"
        case .diaryView:
            return "Error: Diary View"
        }
    }
}
