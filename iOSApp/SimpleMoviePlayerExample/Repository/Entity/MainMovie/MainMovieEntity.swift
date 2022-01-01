//
//  MainMovieEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/06.
//

import Foundation

struct MainMovieEntity: Hashable, Decodable {

    let id: MainMovieId
    let category: String
    let authorName: String
    let pubilshedDate: String
    let thumbnailUrl: String
    let rating: Float
    let totalViews: Int
    let movies: MoviesEntity
    let title: String
    let description: String
    let tags: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case category
        case authorName = "author_name"
        case thumbnailUrl = "thumbnail_url"
        case pubilshedDate = "pubilshed_date"
        case rating
        case totalViews = "total_views"
        case movies
        case title
        case description
        case tags
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(MainMovieId.self, forKey: .id)
        self.category = try container.decode(String.self, forKey: .category)
        self.authorName = try container.decode(String.self, forKey: .authorName)
        self.pubilshedDate = try container.decode(String.self, forKey: .pubilshedDate)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.rating = try container.decode(Float.self, forKey: .rating)
        self.totalViews = try container.decode(Int.self, forKey: .totalViews)
        self.movies = try container.decode(MoviesEntity.self, forKey: .movies)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.tags = try container.decode(String.self, forKey: .tags)
    }

    init(
        id: Int,
        category: String,
        authorName: String,
        pubilshedDate: String,
        thumbnailUrl: String,
        rating: Float,
        totalViews: Int,
        low: String,
        medium: String,
        high: String,
        title: String,
        description: String,
        tags: String
    ) {
        self.id = MainMovieId(value: id)
        self.category = category
        self.authorName = authorName
        self.pubilshedDate = pubilshedDate
        self.thumbnailUrl = thumbnailUrl
        self.rating = rating
        self.totalViews = totalViews
        self.movies = MoviesEntity(
            low: low,
            medium: medium,
            high: high
        )
        self.title = title
        self.description = description
        self.tags = tags
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: MainMovieEntity, rhs: MainMovieEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.category == rhs.category
            && lhs.authorName == rhs.authorName
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.rating == rhs.rating
            && lhs.totalViews == rhs.totalViews
            && lhs.movies == rhs.movies
            && lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.tags == rhs.tags
    }
}
