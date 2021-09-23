//
//  GetFeaturedMoviesUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/23.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetFeaturedMoviesUseCase {
    func execute() -> Single<[FeaturedMovieEntity]>
}

final class GetFeaturedMoviesUseCaseImpl: GetFeaturedMoviesUseCase {

    private let featuredMovieRepository: FeaturedMovieRepository

    // MARK: - Initializer

    init(
        featuredMovieRepository: FeaturedMovieRepository
    ) {
        self.featuredMovieRepository = featuredMovieRepository
    }

    // MARK: - GetFeaturedMoviesUseCase

    func execute() -> Single<[FeaturedMovieEntity]> {
        return featuredMovieRepository.findAll().flatMap { featuredMovies in
            return Single.just(featuredMovies)
        }
    }
}
