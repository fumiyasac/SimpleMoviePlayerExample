//
//  LastShownMainMoviePlayTimeLocalStore.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/08.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol LastShownMainMoviePlayTimeLocalStore {
    func getPlayTime(mainMovieId: MainMovieId) -> Single<Float>
    func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable
    func deletePlayTime(mainMovieId: MainMovieId) -> Completable
}

final class LastShownMainMoviePlayTimeLocalStoreImpl: LastShownMainMoviePlayTimeLocalStore {

    // MARK: - LastShownMainMoviePlayTimeLocalStore

    func getPlayTime(mainMovieId: MainMovieId) -> Single<Float> {
        let key = String(mainMovieId.value)
        let dictionary = Defaults[\.lastShownMainMoviePlayTime]
        var playTime: Float = 0.0
        if let value = dictionary[key] {
            playTime = value
        }
        return Single.just(playTime)
    }

    func savePlayTime(mainMovieId: MainMovieId, playTime: Float) -> Completable {
        let key = String(mainMovieId.value)
        var dictionary = Defaults[\.lastShownMainMoviePlayTime]
        dictionary[key] = playTime
        return Completable.create { completable in
            Defaults[\.lastShownMainMoviePlayTime] = dictionary
            completable(.completed)
            return Disposables.create()
        }
    }

    func deletePlayTime(mainMovieId: MainMovieId) -> Completable {
        let key = String(mainMovieId.value)
        var dictionary = Defaults[\.lastShownMainMoviePlayTime]
        dictionary.removeValue(forKey: key)
        return Completable.create { completable in
            Defaults[\.lastShownMainMoviePlayTime] = dictionary
            completable(.completed)
            return Disposables.create()
        }
    }
}
