//
//  MovieQualityLocalStore.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol MovieQualityLocalStore {
    func get() -> Single<MovieQuality>
    func set(movieQuality: MovieQuality) -> Completable
}

final class MovieQualityLocalStoreImpl: MovieQualityLocalStore {

    // MARK: - MovieQualityLocalStore

    func get() -> Single<MovieQuality> {
        let movieQuality = Defaults[\.movieQuality]
        return Single.just(movieQuality)
    }

    func set(movieQuality: MovieQuality) -> Completable {
        return Completable.create { completable in
            Defaults[\.movieQuality] = movieQuality
            completable(.completed)
            return Disposables.create()
        }
    }
}
