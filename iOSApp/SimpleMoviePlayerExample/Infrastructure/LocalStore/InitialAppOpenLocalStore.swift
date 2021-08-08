//
//  InitialAppOpenLocalStore.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/08.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

//sourcery: AutoMockable
protocol InitialAppOpenLocalStore {
    func get() -> Single<Bool>
    func changeFalse() -> Completable
}

final class InitialAppOpenLocalStoreImpl: InitialAppOpenLocalStore {

    // MARK: - InitialAppOpenLocalStore

    // MEMO: アプリを初めて開いたかの状態を取得する
    func get() -> Single<Bool> {
        let initialAppOpen = Defaults[\.initialAppOpen]
        return Single.just(initialAppOpen)
    }

    // MEMO: アプリを初めて開いた状態をfalseへ更新する
    func changeFalse() -> Completable {
        return Completable.create { completable in
            Defaults[\.initialAppOpen] = false
            completable(.completed)
            return Disposables.create()
        }
    }
}
