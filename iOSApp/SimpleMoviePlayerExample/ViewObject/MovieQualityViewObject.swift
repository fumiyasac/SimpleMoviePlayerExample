//
//  MovieQualityViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/13.
//

import Foundation

final class MovieQualityViewObject: Hashable {

    let title: String
    private (set)var value: String

    // MARK: - Initializer

    init(movieQuality: MovieQuality) {
        title = "動画解像度"
        value = movieQuality.text
    }

    // MARK: - Function

    func update(movieQuality: MovieQuality) {
        value = movieQuality.text
    }
    
    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }

    static func == (lhs: MovieQualityViewObject, rhs: MovieQualityViewObject) -> Bool {
        return lhs.title == rhs.title
    }
}
