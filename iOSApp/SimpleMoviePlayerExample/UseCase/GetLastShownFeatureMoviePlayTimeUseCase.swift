//
//  GetLastShownFeatureMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetLastShownFeatureMoviePlayTimeUseCase {
    func execute(featuredMovieId: FeaturedMovieId) -> Single<Float>
}

final class GetLastShownFeatureMoviePlayTimeUseCaseImpl: GetLastShownFeatureMoviePlayTimeUseCase {

    private let lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository
    ) {
        self.lastShownFeaturedMoviePlayTimeRepository = lastShownFeaturedMoviePlayTimeRepository
    }

    // MARK: - GetLastShownFeatureMoviePlayTimeUseCase

    func execute(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        return lastShownFeaturedMoviePlayTimeRepository.getPlayTime(featuredMovieId: featuredMovieId)
    }
}
