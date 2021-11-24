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

    // MARK: - Initializer

    // MEMO: Backgroundスレッドを指定しなくとも処理自体にはあまり差し支えがないのでこの形としています。
    init(movieSpeedLocalStore: MovieSpeedLocalStore) {
        self.movieSpeedLocalStore = movieSpeedLocalStore
    }

    // MARK: - MovieSpeedRepository

    func find() -> Single<MovieSpeed> {
        return movieSpeedLocalStore.get()
    }

    func save(movieSpeed: MovieSpeed) -> Completable {
        return movieSpeedLocalStore.set(movieSpeed: movieSpeed)
    }
}
