//
//  UserModel.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let email: String
    let password: String
    let name: String
    let birthday: Date
    
    init(id: String = UUID().uuidString, email: String, password: String, name: String, birthday: Date) {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
        self.birthday = birthday
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case password
        case name
        case birthday
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        name = try container.decode(String.self, forKey: .name)
        
        let timestamp = try container.decode(TimeInterval.self, forKey: .birthday)
        birthday = Date(timeIntervalSince1970: timestamp)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(name, forKey: .name)
        try container.encode(birthday.timeIntervalSince1970, forKey: .birthday)
    }
}
