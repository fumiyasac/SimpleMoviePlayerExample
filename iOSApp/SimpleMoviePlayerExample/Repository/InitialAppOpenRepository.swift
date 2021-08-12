//
//  InitialAppOpenRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol InitialAppOpenRepository {
    // 最初にAppを開いたかのステータスを取得する
    func get() -> Single<Bool>
    // 最初にAppを開いたかのステータスをfalseへ更新する
    func changeFalse() -> Completable
}

final class InitialAppOpenRepositoryImpl: InitialAppOpenRepository {

    private let initialAppOpenLocalStore: InitialAppOpenLocalStore
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        initialAppOpenLocalStore: InitialAppOpenLocalStore,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.initialAppOpenLocalStore = initialAppOpenLocalStore
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - InitialAppOpenRepository

    func get() -> Single<Bool> {
        return initialAppOpenLocalStore.get()
            .subscribe(
                on: backgroundScheduler
            )
    }

    func changeFalse() -> Completable {
        initialAppOpenLocalStore.changeFalse()
            .subscribe(
                on: backgroundScheduler
            )
    }
}
