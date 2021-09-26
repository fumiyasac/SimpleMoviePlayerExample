//
//  SaveMovieSpeedUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol SaveMovieSpeedUseCase {
    func execute(movieSpeed: MovieSpeed) -> Completable
}

final class SaveMovieSpeedUseCaseImpl: SaveMovieSpeedUseCase {

    private let movieSpeedRepository: MovieSpeedRepository

    // MARK: - Initializer

    init(
        movieSpeedRepository: MovieSpeedRepository
    ) {
        self.movieSpeedRepository = movieSpeedRepository
    }

    // MARK: - SaveMovieSpeedUseCase

    func execute(movieSpeed: MovieSpeed) -> Completable {
        return movieSpeedRepository.save(movieSpeed: movieSpeed)
    }
}
