//
//  FavoriteMainMovieEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation

struct FavoriteMainMovieEntity: Equatable {

    let mainMovieId: MainMovieId
    var category: String
    var authorName: String
    var pubilshedDate: String
    var thumbnailUrl: String
    var title: String
    var description: String

    // MARK: - Initializer

    init(
        mainMovieId: Int,
        category: String,
        authorName: String,
        pubilshedDate: String,
        thumbnailUrl: String,
        title: String,
        description: String
    ) {
        self.mainMovieId = MainMovieId(value: mainMovieId)
        self.category = category
        self.authorName = authorName
        self.pubilshedDate = pubilshedDate
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.description = description
    }

    // MARK: - Equatable

    static func == (lhs: FavoriteMainMovieEntity, rhs: FavoriteMainMovieEntity) -> Bool {
        return lhs.mainMovieId == rhs.mainMovieId
            && lhs.category == rhs.category
            && lhs.authorName == rhs.authorName
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}
