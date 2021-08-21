//
//  MovieQualityRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MovieQualityRepository {
    // アプリに保存されている画質を取得する
    func find() -> Single<MovieQuality>
    // 選択した画質を保存する
    func save(movieQuality: MovieQuality) -> Completable
}

final class MovieQualityRepositoryImpl: MovieQualityRepository {

    private let movieQualityLocalStore: MovieQualityLocalStore
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        movieQualityLocalStore: MovieQualityLocalStore,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.movieQualityLocalStore = movieQualityLocalStore
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - MovieQualityRepository

    func find() -> Single<MovieQuality> {
        return movieQualityLocalStore.get()
            .subscribe(
                on: backgroundScheduler
            )

    }

    func save(movieQuality: MovieQuality) -> Completable {
        return movieQualityLocalStore.set(movieQuality: movieQuality)
            .subscribe(
                on: backgroundScheduler
            )
    }
}
