//
//  FavoriteViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/12.
//

import Foundation

final class FavoriteViewObject: Hashable {

    let mainMovieId: MainMovieId
    var category: String
    var authorName: String
    var pubilshedDate: String
    var thumbnailUrl: URL?
    var title: String
    var description: String

    init(favoriteMainMovieEntity: FavoriteMainMovieEntity) {
        mainMovieId = favoriteMainMovieEntity.mainMovieId
        category = favoriteMainMovieEntity.category
        authorName = favoriteMainMovieEntity.authorName
        pubilshedDate = favoriteMainMovieEntity.pubilshedDate
        thumbnailUrl = URL(string: favoriteMainMovieEntity.thumbnailUrl) ?? nil
        title = favoriteMainMovieEntity.title
        description = favoriteMainMovieEntity.description
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(mainMovieId.value)
    }

    static func == (lhs: FavoriteViewObject, rhs: FavoriteViewObject) -> Bool {
        return lhs.mainMovieId == rhs.mainMovieId
            && lhs.category == rhs.category
            && lhs.authorName == rhs.authorName
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}
