//
//  MovieSpeedLocalStore.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol MovieSpeedLocalStore {
    func get() -> Single<MovieSpeed>
    func set(movieSpeed: MovieSpeed) -> Completable
}

final class MovieSpeedLocalStoreImpl: MovieSpeedLocalStore {

    // MARK: - MovieSpeedLocalStore

    func get() -> Single<MovieSpeed> {
        let movieSpeed = Defaults[\.movieSpeed]
        return Single.just(movieSpeed)
    }

    func set(movieSpeed: MovieSpeed) -> Completable {
        return Completable.create { completable in
            Defaults[\.movieSpeed] = movieSpeed
            completable(.completed)
            return Disposables.create()
        }
    }
}
