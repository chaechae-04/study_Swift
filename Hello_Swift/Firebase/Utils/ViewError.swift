//
//  ViewError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import Foundation

enum ViewError: LocalizedError {
    case mainViewError
    case todoViewError
    
    var errorDescription: String? {
        switch self {
        case .mainViewError:
            return "main error"
        case .todoViewError:
            return "todo error"
        }
    }
}
