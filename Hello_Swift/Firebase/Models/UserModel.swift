//
//  UserModel.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let password: String
    let name: String
    let birthday: Date
    
    init(id: String, password: String, name: String, birthday: Date) {
        self.id = id
        self.password = password
        self.name = name
        self.birthday = birthday
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case password
        case name
        case birthday
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        password = try container.decode(String.self, forKey: .password)
        name = try container.decode(String.self, forKey: .name)
        
        let timestamp = try container.decode(TimeInterval.self, forKey: .birthday)
        birthday = Date(timeIntervalSince1970: timestamp)
    }
}
