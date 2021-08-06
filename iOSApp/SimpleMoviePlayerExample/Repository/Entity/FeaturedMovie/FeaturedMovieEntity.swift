//
//  FeaturedMovieEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/07.
//

import Foundation

struct FeaturedMovieEntity: Hashable, Decodable {

    let id: FeaturedMovieId
    let authorName: String
    let dateString: String
    let thumbnailUrl: String
    let movies: MoviesEntity
    let title: String
    let description: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case authorName = "author_name"
        case thumbnailUrl = "thumbnail_url"
        case dateString = "date_string"
        case movies
        case title
        case description
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(FeaturedMovieId.self, forKey: .id)
        self.authorName = try container.decode(String.self, forKey: .authorName)
        self.dateString = try container.decode(String.self, forKey: .dateString)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.movies = try container.decode(MoviesEntity.self, forKey: .movies)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: FeaturedMovieEntity, rhs: FeaturedMovieEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.authorName == rhs.authorName
            && lhs.dateString == rhs.dateString
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.movies == rhs.movies
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}
