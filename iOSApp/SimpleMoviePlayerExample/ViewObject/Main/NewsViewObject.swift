//
//  NewsViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/12.
//

import Foundation

final class NewsViewObject: Hashable {

    let id: MainNewsId
    let newsGenre: String
    let pubilshedDate: String
    let thumbnailUrl: URL?
    let title: String
    let description: String

    init(mainNewsEntity: MainNewsEntity) {
        id = mainNewsEntity.id
        newsGenre = mainNewsEntity.newsGenre
        pubilshedDate = mainNewsEntity.pubilshedDate
        thumbnailUrl = URL(string: mainNewsEntity.thumbnailUrl) ?? nil
        title = mainNewsEntity.title
        description = mainNewsEntity.description
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: NewsViewObject, rhs: NewsViewObject) -> Bool {
        return lhs.id == rhs.id
            && lhs.newsGenre == rhs.newsGenre
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
            && lhs.title == rhs.title
            && lhs.description == rhs.description
    }
}
