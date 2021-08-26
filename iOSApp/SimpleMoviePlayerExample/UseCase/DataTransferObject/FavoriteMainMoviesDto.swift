//
//  FavoriteMainMoviesDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation

final class FavoriteMainMoviesDto: Equatable {

    let favoriteMainMovies: [FavoriteMainMovieEntity]

    // MARK: - Initializer

    init(
        favoriteMainMovies: [FavoriteMainMovieEntity]
    ) {
        self.favoriteMainMovies = favoriteMainMovies
    }

    // MARK: - Equatable

    static func == (
        lhs: FavoriteMainMoviesDto,
        rhs: FavoriteMainMoviesDto
    ) -> Bool {
        return lhs.favoriteMainMovies == rhs.favoriteMainMovies
    }
}
