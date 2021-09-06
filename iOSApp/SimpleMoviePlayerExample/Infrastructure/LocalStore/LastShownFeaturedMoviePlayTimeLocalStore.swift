//
//  LastShownFeaturedMoviePlayTimeLocalStore.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/08.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol LastShownFeaturedMoviePlayTimeLocalStore {
    func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float>
    func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable
    func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable
}

final class LastShownFeaturedMoviePlayTimeLocalStoreImpl: LastShownFeaturedMoviePlayTimeLocalStore {

    // MARK: - LastShownFeaturedMoviePlayTimeLocalStore

    func getPlayTime(featuredMovieId: FeaturedMovieId) -> Single<Float> {
        let key = String(featuredMovieId.value)
        let dictionary = Defaults[\.lastShownFeaturedMoviePlayTime]
        var playTime: Float = 0.0
        if let value = dictionary[key] {
            playTime = value
        }
        return Single.just(playTime)
    }

    func savePlayTime(featuredMovieId: FeaturedMovieId, playTime: Float) -> Completable {
        let key = String(featuredMovieId.value)
        var dictionary = Defaults[\.lastShownFeaturedMoviePlayTime]
        dictionary[key] = playTime
        return Completable.create { completable in
            Defaults[\.lastShownFeaturedMoviePlayTime] = dictionary
            completable(.completed)
            return Disposables.create()
        }
    }

    func deletePlayTime(featuredMovieId: FeaturedMovieId) -> Completable {
        let key = String(featuredMovieId.value)
        var dictionary = Defaults[\.lastShownFeaturedMoviePlayTime]
        dictionary.removeValue(forKey: key)
        return Completable.create { completable in
            Defaults[\.lastShownFeaturedMoviePlayTime] = dictionary
            completable(.completed)
            return Disposables.create()
        }
    }
}
