//
//  LastShownFeaturedMoviePlayTimeRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol LastShownFeaturedMoviePlayTimeRepository {
    // featuredMovieIdに紐づく保存されている再生時間を取得する
    func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float>
    // featuredMovieIdに紐づく保存されている再生時間を更新する
    func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable
}

final class LastShownFeaturedMoviePlayTimeRepositoryImpl: LastShownFeaturedMoviePlayTimeRepository {

    private let lastShownFeaturedMoviePlayTimeLocalStore: LastShownFeaturedMoviePlayTimeLocalStore
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        lastShownFeaturedMoviePlayTimeLocalStore: LastShownFeaturedMoviePlayTimeLocalStore,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.lastShownFeaturedMoviePlayTimeLocalStore = lastShownFeaturedMoviePlayTimeLocalStore
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - LastShownFeaturedMoviePlayTimeRepository

    func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        return lastShownFeaturedMoviePlayTimeLocalStore
            .getPlayTime(
                featuredMovieId: featuredMovieId
            )
            .subscribe(
                on: backgroundScheduler
            )
    }
    
    func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable {
        return lastShownFeaturedMoviePlayTimeLocalStore
            .savePlayTime(
                featuredMovieId: featuredMovieId,
                playTime: playTime
            )
            .subscribe(
                on: backgroundScheduler
            )
    }
}
