//
//  MainDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation

final class MainDto: Equatable {

    let shouldShowToolTip: Bool
    let mainNews: [MainNewsEntity]
    let featuredMovies: [FeaturedMovieEntity]
    let mainMovies: [MainMovieEntity]

    // MARK: - Initializer

    init(
        shouldShowToolTip: Bool,
        mainNews: [MainNewsEntity],
        featuredMovies: [FeaturedMovieEntity],
        mainMovies: [MainMovieEntity]
    ) {
        self.shouldShowToolTip = shouldShowToolTip
        self.mainNews = mainNews
        self.featuredMovies = featuredMovies
        self.mainMovies = mainMovies
    }

    // MARK: - Equatable

    static func == (
        lhs: MainDto,
        rhs: MainDto
    ) -> Bool {
        return lhs.shouldShowToolTip == rhs.shouldShowToolTip &&
            lhs.mainNews == rhs.mainNews &&
            lhs.featuredMovies == rhs.featuredMovies &&
            lhs.mainMovies == rhs.mainMovies
    }
}
