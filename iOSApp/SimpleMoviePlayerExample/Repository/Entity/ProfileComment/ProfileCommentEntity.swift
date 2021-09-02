//
//  ProfileCommentEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/02.
//

import Foundation

struct ProfileCommentEntity: Hashable, Decodable {

    let id: ProfileCommentId
    let evaluation: String
    let authorName: String
    let dateString: String
    let detail: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case evaluation
        case authorName = "author_name"
        case dateString = "date_string"
        case detail
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(ProfileCommentId.self, forKey: .id)
        self.evaluation = try container.decode(String.self, forKey: .evaluation)
        self.authorName = try container.decode(String.self, forKey: .authorName)
        self.dateString = try container.decode(String.self, forKey: .dateString)
        self.detail = try container.decode(String.self, forKey: .detail)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: ProfileCommentEntity, rhs: ProfileCommentEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.evaluation == rhs.evaluation
            && lhs.authorName == rhs.authorName
            && lhs.dateString == rhs.dateString
            && lhs.detail == rhs.detail
    }
}

