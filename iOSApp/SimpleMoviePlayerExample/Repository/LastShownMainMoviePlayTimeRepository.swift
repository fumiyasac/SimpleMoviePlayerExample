//
//  LastShownMainMoviePlayTimeRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol LastShownMainMoviePlayTimeRepository {
    // mainMovieIdに紐づく保存されている再生時間を取得する
    func getPlayTime(mainMovieId: MainMovieId) -> Single<Float>
    // mainMovieIdに紐づく保存されている再生時間を更新する
    func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable
}

final class LastShownMainMoviePlayTimeRepositoryImpl: LastShownMainMoviePlayTimeRepository {

    private let lastShownMainMoviePlayTimeLocalStore: LastShownMainMoviePlayTimeLocalStore
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        lastShownMainMoviePlayTimeLocalStore: LastShownMainMoviePlayTimeLocalStore,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.lastShownMainMoviePlayTimeLocalStore = lastShownMainMoviePlayTimeLocalStore
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - LastShownMainMoviePlayTimeRepository

    func getPlayTime(mainMovieId: MainMovieId) -> Single<Float> {
        return lastShownMainMoviePlayTimeLocalStore
            .getPlayTime(
                mainMovieId: mainMovieId
            )
            .subscribe(
                on: backgroundScheduler
            )
    }

    func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable {
        return lastShownMainMoviePlayTimeLocalStore
            .savePlayTime(
                mainMovieId: mainMovieId,
                playTime: playTime
            )
            .subscribe(
                on: backgroundScheduler
            )
    }
}
