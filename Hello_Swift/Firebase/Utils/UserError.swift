//
//  UserError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

enum UserError: LocalizedError {
    case invalidId
    case invalidEmail
    case invalidPassword
    case duplicateId
    case invalidDate
    
    case userNotFound
    case userPwNotFound
    
    var errorDescription: String? {
        switch self {
        case .invalidId:
            return "아이디를 입력해주세요."
        case .invalidEmail:
            return "올바르지 않은 이메일입니다."
        case .invalidPassword:
            return "비밀번호는 영문 5자 이상, 숫자를 포함해야 합니다."
        case .duplicateId:
            return "이미 사용중인 아이디입니다."
        case .invalidDate:
            return "올바른 생년월일 형식이 아닙니다."
        case .userNotFound:
            return "존재하지 않는 아이디입니다."
        case .userPwNotFound:
            return "비밀번호가 맞지 않습니다."
        }
    }
}
