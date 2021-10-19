//
//  MovieSpeedViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/13.
//

import Foundation

final class MovieSpeedViewObject: Hashable {

    let movieSpeed: MovieSpeed
    let title: String
    let value: String

    // MARK: - Initializer

    init(movieSpeed: MovieSpeed) {
        self.movieSpeed = movieSpeed
        title = "動画速度"
        value = "\(movieSpeed.rawValue)"
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(movieSpeed.rawValue)
    }

    static func == (lhs: MovieSpeedViewObject, rhs: MovieSpeedViewObject) -> Bool {
        return lhs.movieSpeed == rhs.movieSpeed
            && lhs.title == rhs.title
            && lhs.value == rhs.value
    }
}
