//
//  UserDefaultsManager.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    
    func saveUser(_ user: UserModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            defaults.set(encoded, forKey: "currentUser")
        }
    }
    
    func getCurrentUser() -> UserModel? {
        if let savedUser = defaults.object(forKey: "currentUser") as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(UserModel.self, from: savedUser)
        }
        return nil
    }
    
    func clearUser() {
        defaults.removeObject(forKey: "currentUser")
    }
}
