//
//  FeatureMovieViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/12.
//

import Foundation

final class FeatureMovieViewObject: Hashable {

    let id: FeaturedMovieId
    let authorName: String
    let pubilshedDate: String
    let thumbnailUrl: URL?
    let title: String
    let description: String

    // MARK: - Initializer

    init(featuredMovieEntity: FeaturedMovieEntity) {
        id = featuredMovieEntity.id
        authorName = featuredMovieEntity.authorName
        pubilshedDate = featuredMovieEntity.pubilshedDate
        thumbnailUrl = URL(string: featuredMovieEntity.thumbnailUrl) ?? nil
        title = featuredMovieEntity.title
        description = featuredMovieEntity.description
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: FeatureMovieViewObject, rhs: FeatureMovieViewObject) -> Bool {
        return lhs.id == rhs.id
            && lhs.authorName == rhs.authorName
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}
