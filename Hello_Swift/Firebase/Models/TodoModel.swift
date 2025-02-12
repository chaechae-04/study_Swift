//
//  TodoModel.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation
import FirebaseFirestore

struct TodoModel: Codable, Identifiable {
    let id: String
    let userId: String
    let category: String
    let dateTime: Date
    let title: String
    let content: String
    var complete: Bool
    
    init(id: String = UUID().uuidString, userId: String, category: String, dateTime: Date = Date(), title: String, content: String, complete: Bool = false) {
        self.id = id
        self.userId = userId
        self.category = category
        self.dateTime = dateTime
        self.title = title
        self.content = content
        self.complete = complete
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case dateTime
        case category
        case title
        case content
        case complete
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        userId = try container.decode(String.self, forKey: .userId)
        category = try container.decode(String.self, forKey: .category)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        complete = try container.decode(Bool.self, forKey: .complete)
        
        if let timestamp = try container.decode(Timestamp?.self, forKey: .dateTime) {
            dateTime = timestamp.dateValue()
        } else {
            dateTime = Date()
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(category, forKey: .category)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(complete, forKey: .complete)
        try container.encode(Timestamp(date: dateTime), forKey: .dateTime)
    }
}
