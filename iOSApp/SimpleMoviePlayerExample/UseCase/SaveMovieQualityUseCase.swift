//
//  SaveMovieQualityUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol SaveMovieQualityUseCase {
    func execute(movieQuality: MovieQuality) -> Completable
}

final class SaveMovieQualityUseCaseImpl: SaveMovieQualityUseCase {

    private let movieQualityRepository: MovieQualityRepository

    // MARK: - Initializer

    init(
        movieQualityRepository: MovieQualityRepository
    ) {
        self.movieQualityRepository = movieQualityRepository
    }

    // MARK: - SaveMovieQualityUseCase

    func execute(movieQuality: MovieQuality) -> Completable {
        return movieQualityRepository.save(movieQuality: movieQuality)
    }
}
