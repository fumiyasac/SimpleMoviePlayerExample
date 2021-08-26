//
//  GetMovieSettingsUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetMovieSettingsUseCase {
    // 画面表示に必要なデータを返す
    func execute() -> Single<MovieSettingsDto>
}

final class GetMovieSettingsUseCaseImpl: GetMovieSettingsUseCase {

    private let movieQualityRepository: MovieQualityRepository
    private let movieSpeedRepository: MovieSpeedRepository

    // MARK: - Initializer

    init(
        movieQualityRepository: MovieQualityRepository,
        movieSpeedRepository: MovieSpeedRepository
    ) {
        self.movieQualityRepository = movieQualityRepository
        self.movieSpeedRepository = movieSpeedRepository
    }

    // MARK: - GetMovieSettingsUseCase

    func execute() -> Single<MovieSettingsDto> {
        return Single.zip(
            movieQualityRepository.find(),
            movieSpeedRepository.find()
        ).map { movieSettings -> MovieSettingsDto in
            let (movieQuality, movieSpeed) = movieSettings
            return MovieSettingsDto(
                movieQuality: movieQuality,
                movieSpeed: movieSpeed
            )
        }
    }
}
