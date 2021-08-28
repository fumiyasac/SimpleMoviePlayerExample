//
//  SaveLastShownFeatureMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol SaveLastShownFeatureMoviePlayTimeUseCase {
    func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable
}

final class SaveLastShownFeatureMoviePlayTimeUseCaseImpl: SaveLastShownFeatureMoviePlayTimeUseCase {

    private let lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository
    ) {
        self.lastShownFeaturedMoviePlayTimeRepository = lastShownFeaturedMoviePlayTimeRepository
    }

    // MARK: - SaveLastShownFeatureMoviePlayTimeUseCase

    func savePlayTime(
        featuredMovieId: FeaturedMovieId,
        playTime: Float
    ) -> Completable {
        return lastShownFeaturedMoviePlayTimeRepository.savePlayTime(
            featuredMovieId: featuredMovieId,
            playTime: playTime
        )
    }
}
