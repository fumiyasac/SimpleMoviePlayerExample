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

    // MARK: - Initializer

    // MEMO: Backgroundスレッドを指定しなくとも処理自体にはあまり差し支えがないのでこの形としています。
    init(movieQualityLocalStore: MovieQualityLocalStore) {
        self.movieQualityLocalStore = movieQualityLocalStore
    }

    // MARK: - MovieQualityRepository

    func find() -> Single<MovieQuality> {
        return movieQualityLocalStore.get()
    }

    func save(movieQuality: MovieQuality) -> Completable {
        return movieQualityLocalStore.set(movieQuality: movieQuality)
    }
}
