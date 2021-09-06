//
//  DeleteLastShownFeatureMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/06.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol DeleteLastShownFeatureMoviePlayTimeUseCase {
    func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable
}

final class DeleteLastShownFeatureMoviePlayTimeUseCaseImpl: DeleteLastShownFeatureMoviePlayTimeUseCase {

    private let lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownFeaturedMoviePlayTimeRepository: LastShownFeaturedMoviePlayTimeRepository
    ) {
        self.lastShownFeaturedMoviePlayTimeRepository = lastShownFeaturedMoviePlayTimeRepository
    }

    // MARK: - DeleteLastShownFeatureMoviePlayTimeUseCaseImpl

    func deletePlayTime(
        featuredMovieId: FeaturedMovieId
    ) -> Completable {
        return lastShownFeaturedMoviePlayTimeRepository.deletePlayTime(featuredMovieId: featuredMovieId)
    }
}
