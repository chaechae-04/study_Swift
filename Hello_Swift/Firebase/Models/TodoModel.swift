//
//  TodoModel.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import Foundation

struct TodoModel: Codable {
    let id: String
    let category: String
    let dateTime: Date
    let title: String
    let content: String
    var complete: Bool
    
    init(id: String = UUID().uuidString, category: String, dateTime: Date = Date(), title: String, content: String, complete: Bool = false) {
        self.id = id
        self.category = category
        self.dateTime = dateTime
        self.title = title
        self.content = content
        self.complete = complete
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateTime
        case category
        case title
        case content
        case complete
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        category = try container.decode(String.self, forKey: .category)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        complete = try container.decode(Bool.self, forKey: .complete)
        
        let timestamp = try container.decode(TimeInterval.self, forKey: .dateTime)
        dateTime = Date(timeIntervalSince1970: timestamp)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(category, forKey: .category)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(complete, forKey: .complete)
        try container.encode(dateTime.timeIntervalSince1970, forKey: .dateTime)
    }
}
