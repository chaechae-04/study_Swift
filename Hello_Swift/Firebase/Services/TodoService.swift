//
//  TodoService.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import Combine

class TodoService: ObservableObject {
    @Published var crrentUser: UserModel?
    
    static let shared = UserService()
    private let db = Firestore.firestore()
}
