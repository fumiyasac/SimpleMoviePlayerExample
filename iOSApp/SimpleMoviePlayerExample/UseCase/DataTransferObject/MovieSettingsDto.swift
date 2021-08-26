//
//  MovieSettingsDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation

final class MovieSettingsDto: Equatable {

    let movieQuality: MovieQuality
    let movieSpeed: MovieSpeed

    // MARK: - Initializer

    init(
        movieQuality: MovieQuality,
        movieSpeed: MovieSpeed
    ) {
        self.movieQuality = movieQuality
        self.movieSpeed = movieSpeed
    }

    // MARK: - Equatable

    static func == (
        lhs: MovieSettingsDto,
        rhs: MovieSettingsDto
    ) -> Bool {
        return lhs.movieQuality == rhs.movieQuality &&
            lhs.movieSpeed == rhs.movieSpeed
    }
}
