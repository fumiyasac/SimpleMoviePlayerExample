//
//  MainMovieViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/12.
//

import Foundation

final class MainMovieViewObject: MainDiffableDataSourceCompatible {

    let id: MainMovieId
    let category: String
    let authorName: String
    let pubilshedDate: String
    let thumbnailUrl: URL?
    let rating: String
    let totalViews: String
    let title: String
    let description: String
    let tags: String

    // MARK: - Initializer

    init(mainMovieEntity: MainMovieEntity) {
        id = mainMovieEntity.id
        category = mainMovieEntity.category
        authorName = mainMovieEntity.authorName
        pubilshedDate = mainMovieEntity.pubilshedDate
        thumbnailUrl = URL(string: mainMovieEntity.thumbnailUrl) ?? nil
        rating = "\(mainMovieEntity.rating)"
        if mainMovieEntity.totalViews > 1000 {
            totalViews = String(format: "%.01f", Float(mainMovieEntity.totalViews / 1000)) + "K"
        } else {
            totalViews = "\(mainMovieEntity.totalViews)"
        }
        title = mainMovieEntity.title
        description = mainMovieEntity.description
        tags = mainMovieEntity.tags
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: MainMovieViewObject, rhs: MainMovieViewObject) -> Bool {
        return lhs.id == rhs.id
            && lhs.category == rhs.category
            && lhs.authorName == rhs.authorName
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.rating == rhs.rating
            && lhs.totalViews == rhs.totalViews
            && lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.tags == rhs.tags
    }
}
