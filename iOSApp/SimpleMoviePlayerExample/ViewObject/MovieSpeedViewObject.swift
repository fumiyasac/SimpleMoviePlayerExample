//
//  MovieSpeedViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/13.
//

import Foundation

final class MovieSpeedViewObject: Hashable {

    let title: String
    private (set)var value: String

    // MARK: - Initializer

    init(movieSpeed: MovieSpeed) {
        title = "動画再生速度"
        value = "\(movieSpeed.rawValue)倍速"
    }

    // MARK: - Function

    func update(movieSpeed: MovieSpeed) {
        value = "\(movieSpeed.rawValue)倍速"
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }

    static func == (lhs: MovieSpeedViewObject, rhs: MovieSpeedViewObject) -> Bool {
        return lhs.title == rhs.title
    }
}
