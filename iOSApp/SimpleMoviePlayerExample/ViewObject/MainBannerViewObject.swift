//
//  MainBannerViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/12.
//

import Foundation

final class MainBannerViewObject: Hashable {

    let id: MainBannerId
    let title: String
    let category: String
    let summary: String
    let pubilshedDate: String
    let thumbnailUrl: URL?

    // MARK: - Initializer

    init(mainBannerEntity: MainBannerEntity) {
        id = mainBannerEntity.id
        title = mainBannerEntity.title
        category = mainBannerEntity.category
        summary = mainBannerEntity.summary
        pubilshedDate = mainBannerEntity.pubilshedDate
        thumbnailUrl = URL(string: mainBannerEntity.thumbnailUrl) ?? nil
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: MainBannerViewObject, rhs: MainBannerViewObject) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.category == rhs.category
            && lhs.summary == rhs.summary
            && lhs.pubilshedDate == rhs.pubilshedDate
            && lhs.thumbnailUrl == rhs.thumbnailUrl
    }
}
