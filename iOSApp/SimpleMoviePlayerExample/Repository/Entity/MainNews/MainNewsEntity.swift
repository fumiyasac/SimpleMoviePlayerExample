//
//  MainNewsEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/07.
//

import Foundation

struct MainNewsEntity: Hashable, Decodable {

    let id: MainNewsId
    let newsGenre: String
    let pubilshedDate: String
    let thumbnailUrl: String
    let title: String
    let description: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case newsGenre = "news_genre"
        case pubilshedDate = "pubilshed_date"
        case thumbnailUrl = "thumbnail_url"
        case title
        case description
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(MainNewsId.self, forKey: .id)
        self.newsGenre = try container.decode(String.self, forKey: .newsGenre)
        self.pubilshedDate = try container.decode(String.self, forKey: .pubilshedDate)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: MainNewsEntity, rhs: MainNewsEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.newsGenre == rhs.newsGenre
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}

