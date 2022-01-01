//
//  MainBannerEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/07.
//

import Foundation

struct MainBannerEntity: Hashable, Decodable {

    let id: MainBannerId
    let title: String
    let category: String
    let summary: String
    let pubilshedDate: String
    let thumbnailUrl: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case title
        case category
        case summary
        case pubilshedDate = "pubilshed_date"
        case thumbnailUrl = "thumbnail_url"
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(MainBannerId.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.category = try container.decode(String.self, forKey: .category)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.pubilshedDate = try container.decode(String.self, forKey: .pubilshedDate)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }

    init(
        id: Int,
        title: String,
        category: String,
        summary: String,
        pubilshedDate: String,
        thumbnailUrl: String
    ) {
        self.id = MainBannerId(value: id)
        self.title = title
        self.category = category
        self.summary = summary
        self.pubilshedDate = pubilshedDate
        self.thumbnailUrl = thumbnailUrl
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: MainBannerEntity, rhs: MainBannerEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.category == rhs.category
            && lhs.summary == rhs.summary
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
    }
}
