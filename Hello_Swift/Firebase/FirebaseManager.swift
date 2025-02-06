//
//  FirebaseManager.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

class FirebaseManager {
    static let shared = FirebaseManager()
    
    func save<T: Codable>(_ data: T, to path: String) {
        // 저장
    }
    
    func patch<T: Codable>(from path: String) -> T? {
        // 불러오기
        return nil
    }
}
