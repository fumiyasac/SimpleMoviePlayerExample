//
//  MovieQualityViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/13.
//

import Foundation

final class MovieQualityViewObject: Hashable {

    let movieQuality: MovieQuality
    let title: String
    let value: String

    // MARK: - Initializer

    init(movieQuality: MovieQuality) {
        self.movieQuality = movieQuality
        title = "動画解像度"
        value = movieQuality.text
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(movieQuality.rawValue)
    }

    static func == (lhs: MovieQualityViewObject, rhs: MovieQualityViewObject) -> Bool {
        return lhs.movieQuality == rhs.movieQuality
            && lhs.title == rhs.title
            && lhs.value == rhs.value
    }
}
