//
//  UserService.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import Combine

class UserService: ObservableObject {
    @Published var crrentUser: UserModel?
    
    static let shared = UserService()
    private let db = Firestore.firestore()
    
    func saveUser(_ user: UserModel) async throws {
        try await db.collection("users").document(user.id).setData([
            "id": user.id,
            "email": user.email,
            "password": user.password,
            "name": user.name,
            "birthday": user.birthday
        ])
    }
    
    func getUser(id: String) async throws -> UserModel? {
        
        if id.isEmpty { throw UserError.invalidId }
        
        let document = try await db.collection("users").document(id).getDocument()
        
        if !document.exists { throw UserError.invalidId }
        
        guard let data = document.data() else { return nil }
        
        return UserModel(
            id: data["id"] as? String ?? "",
            email: data["email"] as? String ?? "",
            password: data["password"] as? String ?? "",
            name: data["name"] as? String ?? "",
            birthday: (data["birthday"] as? Timestamp)?.dateValue() ?? Date()
        )
    }
    
    func checkUserExists(id: String) async throws -> Bool {
        let document = try await db.collection("users").document(id).getDocument()
        return document.exists
    }
    
    /** 회원가입 */
    func signUp(id: String, email: String, password: String, name: String, birthday: String) async throws -> UserModel {
        
        // 빈값 체크
        guard !id.isEmpty else { throw UserError.emptyId }
        guard !password.isEmpty else { throw UserError.emptyPassword }
        guard !email.isEmpty else { throw UserError.emptyEmail }
        guard !name.isEmpty else { throw UserError.emptyName }
        guard !birthday.isEmpty else { throw UserError.emptyBirthday }
        
        // ID 중복 체크
        if try await checkUserExists(id: id) { throw UserError.duplicateId }
        // Email 형식 검사
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        guard NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) else { throw UserError.invalidEmail }
        // 비밀번호 유효성 검사 (영어 5글자 이상, 숫자 포함)
        let passwordRegex = "^(?=.*[A-Za-z]{5,})(?=.*\\d).+$"
        guard NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password) else { throw UserError.invalidPassword }
        // 생일 포맷 검사
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let birthdayDate = dateFormatter.date(from: birthday) else { throw UserError.invalidBirthday }
        
        let user = UserModel(id: id, email: email, password: password, name: name, birthday: birthdayDate)
        try await saveUser(user)
        return user
    }
    
    /** 회원탈퇴 */
    func deleteUser(id: String) async throws {
        
        guard let _ = try await getUser(id: id) else { throw UserError.userNotFound }
        
        try await db.collection("users").document(id).delete()
        UserDefaultsManager.shared.clearUser()
    }
    
    /** 로그인 */
    func signIn(id: String, password: String) async throws -> UserModel {
        
        guard !id.isEmpty else { throw UserError.emptyId }
        guard !password.isEmpty else { throw UserError.emptyPassword }
        
        guard let user = try await getUser(id: id) else { throw UserError.userNotFound }
        guard user.password == password else { throw UserError.userPwNotFound }
        
        UserDefaultsManager.shared.saveUser(user)
        
        return user
    }
    
    /** 로그아웃 */
    func signOut() throws {
        UserDefaultsManager.shared.clearUser()
    }
    
    func getCurrentUser() -> UserModel? {
        return UserDefaultsManager.shared.getCurrentUser()
    }
    
}
