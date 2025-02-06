//
//  UserService.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class UserService {
    static let shared = UserService()
    private let db = Firestore.firestore()
    
    func saveUser(_ user: UserModel) async throws {
        try await db.collection("users").document(user.id).setData([
            "id": user.id,
            "password": user.password,
            "name": user.name,
            "birthday": user.birthday
        ])
    }
    
    func getUser(id: String) async throws -> UserModel? {
        let document = try await db.collection("users").document(id).getDocument()
        guard let data = document.data() else { return nil }
        
        return UserModel(
            id: data["id"] as? String ?? "",
            password: data["password"] as? String ?? "",
            name: data["name"] as? String ?? "",
            birthday: (data["birthday"] as? Timestamp)?.dateValue() ?? Date()
        )
    }
    
    func sighUp(id: String, password: String, name: String, birthday: String) async throws -> UserModel {
        
        // ID 중복 체크
        if let _ = try await getUser(id: id) { throw UserError.duplicateId }
        // ID 검사 (빈값 체크)
        guard !id.isEmpty else { throw UserError.invalidId }
        // 비밀번호 유효성 검사 (영어 5글자 이상, 숫자 포함)
        let passwordRegex = "^(?=.*[A-Za-z]{5,})(?=.*\\d).+$"
        guard NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password) else { throw UserError.invalidPassword }
        // 생일 포맷 검사
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let birthdayDate = dateFormatter.date(from: birthday) else { throw UserError.invalidDate }
        
        let user = UserModel(id: id, password: password, name: name, birthday: birthdayDate)
        try await saveUser(user)
        return user
    }
}
