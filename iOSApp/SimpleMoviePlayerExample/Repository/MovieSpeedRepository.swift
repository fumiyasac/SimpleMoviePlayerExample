//
//  MovieSpeedRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MovieSpeedRepository {
    // アプリに保存されている再生レートを取得する
    func find() -> Single<MovieSpeed>
    // 選択した再生レートを保存する
    func save(movieSpeed: MovieSpeed) -> Completable
}

final class MovieSpeedRepositoryImpl: MovieSpeedRepository {

    private let movieSpeedLocalStore: MovieSpeedLocalStore
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        movieSpeedLocalStore: MovieSpeedLocalStore,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.movieSpeedLocalStore = movieSpeedLocalStore
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - MovieSpeedRepository

    func find() -> Single<MovieSpeed> {
        return movieSpeedLocalStore.get()
            .subscribe(
                on: backgroundScheduler
            )
    }

    func save(movieSpeed: MovieSpeed) -> Completable {
        return movieSpeedLocalStore.set(movieSpeed: movieSpeed)
            .subscribe(
                on: backgroundScheduler
            )
    }
}
