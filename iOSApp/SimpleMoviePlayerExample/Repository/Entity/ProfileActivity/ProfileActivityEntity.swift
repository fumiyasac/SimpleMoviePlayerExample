//
//  ProfileActivityEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/02.
//

import Foundation

struct ProfileActivityEntity: Hashable, Decodable {

    let id: ProfileActivityId
    let category: String
    let dateString: String
    let detail: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case category
        case dateString = "date_string"
        case detail
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(ProfileActivityId.self, forKey: .id)
        self.category = try container.decode(String.self, forKey: .category)
        self.dateString = try container.decode(String.self, forKey: .dateString)
        self.detail = try container.decode(String.self, forKey: .detail)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: ProfileActivityEntity, rhs: ProfileActivityEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.category == rhs.category
            && lhs.dateString == rhs.dateString
            && lhs.detail == rhs.detail
    }
}
