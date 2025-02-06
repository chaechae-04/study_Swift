//
//  UserError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

enum UserError: LocalizedError {
    case invalidId
    case invalidPassword
    case duplicateId
    case invalidDate
    
    var errorDescription: String? {
        switch self {
        case .invalidId:
            return "아이디를 입력해주세요."
        case .invalidPassword:
            return "비밀번호는 영문 5자 이상, 숫자를 포함해야 합니다."
        case .duplicateId:
            return "이미 사용중인 아이디입니다."
        case .invalidDate:
            return "올바른 생년월일 형식이 아닙니다."
        }
    }
}
