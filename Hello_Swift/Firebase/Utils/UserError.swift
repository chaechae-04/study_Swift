//
//  UserError.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

enum UserError: LocalizedError {
    case emptyId
    case emptyEmail
    case emptyPassword
    case emptyName
    case emptyBirthday
    
    case invalidId
    case invalidEmail
    case invalidPassword
    case invalidName
    case invalidBirthday
    
    case duplicateId
    
    case userNotFound
    case userPwNotFound
    
    var errorDescription: String? {
        switch self {
        /* 빈칸 체크 */
        case .emptyId:
            return "아이디가 비어있습니다."
        case .emptyEmail:
            return "이메일이 비어있습니다."
        case .emptyPassword:
            return "비밀번호가 비어있습니다."
        case .emptyName:
            return "이름이 비어있습니다."
        case .emptyBirthday:
            return "생일이 비어있습니다."
            
        /* 유효성 체크 */
        case .invalidId:
            return "유효하지 않은 아이디입니다."
        case .invalidEmail:
            return "올바르지 않은 이메일입니다."
        case .invalidPassword:
            return "비밀번호는 영문 5자 이상, 숫자를 포함해야 합니다."
        case .invalidName:
            return "아이디 입력이 비어있습니다."
        case .invalidBirthday:
            return "올바른 생년월일 형식이 아닙니다."
            
        /* 중복 체크 */
        case .duplicateId:
            return "이미 사용중인 아이디입니다."
            
        /* 데이터 체크 */
        case .userNotFound:
            return "존재하지 않는 아이디입니다."
        case .userPwNotFound:
            return "비밀번호가 맞지 않습니다."
        }
    }
}
