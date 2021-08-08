//
//  DependenciesDefinition.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import Foundation
import RxSwift

final class DependenciesDefinition {

    // MARK: - Function

    func inject() {

        // MEMO: 同じProtocolを適合させるがLocalに保持したデータを利用したい際につける名前
        let local = "local"

        // MEMO: 処理を実行する際にバックグラウンドスレッドにしたい際につける名前
        let background = "background"

        // MEMO: インスタンスを保持するための場所
        let dependecies = DependeciesContainer.shared

        // MARK: - Scheduler

        // メインスレッド動作
        dependecies.register(
            ImmediateSchedulerType.self,
            impl: MainScheduler.instance
        )
        // バックグラウンドスレッド動作
        dependecies.register(
            ImmediateSchedulerType.self,
            impl: SerialDispatchQueueScheduler(qos: .default),
            name: background
        )

        // MARK: - Infra

        // MEMO: (1) API関連処理部分
        dependecies.register(
            ApiClient.self,
            impl: ApiClientManager.shared
        )

        // MEMO: (2) UserDefault関連処理部分
        dependecies.register(
            InitialAppOpenLocalStore.self,
            impl: InitialAppOpenLocalStoreImpl()
        )
        dependecies.register(
            LastShownFeaturedMoviePlayTimeLocalStore.self,
            impl: LastShownFeaturedMoviePlayTimeLocalStoreImpl()
        )
        dependecies.register(
            LastShownMainMoviePlayTimeLocalStore.self,
            impl: LastShownMainMoviePlayTimeLocalStoreImpl()
        )

        // MEMO: (3) SQLite関連処理部分

        // MARK: - Repository

        // MARK: - Scheduler

        // MARK: - Presenter
    }
}
