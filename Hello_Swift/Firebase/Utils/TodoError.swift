//
//  TodoError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation

enum TodoError: LocalizedError {
    case invalidId
    case invalidCategory
    case invalidDateTime
    case invalidTitle
    case invalidContent
    case invalidComplete
    case categoryTooLong
    case titleTooLong
    case contentTooLong
    
    var errorDescription: String? {
        switch self {
        case .invalidId:
            return "Error: ID"
        case .invalidCategory:
            return "Error: Category"
        case .invalidDateTime:
            return "Error: Date Time"
        case .invalidTitle:
            return "Error: Title"
        case .invalidContent:
            return "Error: Content"
        case .invalidComplete:
            return "Error: Complete"
        case .categoryTooLong:
            return "Error: Category Too Long"
        case .titleTooLong:
            return "Error: Title Too Long"
        case .contentTooLong:
            return "Error: Content Too Long"
        }
    }
}
