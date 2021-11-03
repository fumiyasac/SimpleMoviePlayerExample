//
//  GetFavoriteMainMoviesUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetFavoriteMainMoviesUseCase {
    func execute() -> Single<FavoriteMainMoviesDto>
}

final class GetFavoriteMainMoviesUseCaseImpl: GetFavoriteMainMoviesUseCase {

    private let favoriteMainMovieRepository: FavoriteMainMovieRepository

    // MARK: - Initializer

    init(
        favoriteMainMovieRepository: FavoriteMainMovieRepository
    ) {
        self.favoriteMainMovieRepository = favoriteMainMovieRepository
    }

    // MARK: - GetFavoriteMainMoviesUseCase

    func execute() -> Single<FavoriteMainMoviesDto> {
        return favoriteMainMovieRepository.findAll().flatMap { favoriteMainMovies in
            return Single.just(FavoriteMainMoviesDto(favoriteMainMovies: favoriteMainMovies))
        }
    }
}
