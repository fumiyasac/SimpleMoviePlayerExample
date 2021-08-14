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
        // MEMO: Simulator検証時にはこちらを利用
        /*
        dependecies.register(
            ApiClient.self,
            impl: ApiClientMock.shared
        )
        */

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

        dependecies.register(
            InitialAppOpenRepository.self,
            impl: InitialAppOpenRepositoryImpl(
                initialAppOpenLocalStore: dependecies.resolve(InitialAppOpenLocalStore.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            LastShownFeaturedMoviePlayTimeRepository.self,
            impl: LastShownFeaturedMoviePlayTimeRepositoryImpl(
                lastShownFeaturedMoviePlayTimeLocalStore: dependecies.resolve(LastShownFeaturedMoviePlayTimeLocalStore.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            LastShownMainMoviePlayTimeRepository.self,
            impl: LastShownMainMoviePlayTimeRepositoryImpl(
                lastShownMainMoviePlayTimeLocalStore: dependecies.resolve(LastShownMainMoviePlayTimeLocalStore.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            FeaturedMovieRepository.self,
            impl: FeaturedMovieRepositoryImpl(
                apiClient: dependecies.resolve(ApiClient.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            MainBannerRepository.self,
            impl: MainBannerRepositoryImpl(
                apiClient: dependecies.resolve(ApiClient.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            MainMovieRepository.self,
            impl: MainMovieRepositoryImpl(
                apiClient: dependecies.resolve(ApiClient.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            MainNewsRepository.self,
            impl: MainNewsRepositoryImpl(
                apiClient: dependecies.resolve(ApiClient.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )

        // MARK: - UseCase

        dependecies.register(
            MainUseCase.self,
            impl: MainUseCaseImpl(
                initialAppOpenRepository: dependecies.resolve(InitialAppOpenRepository.self),
                mainNewsRepository: dependecies.resolve(MainNewsRepository.self),
                featuredMovieRepository: dependecies.resolve(FeaturedMovieRepository.self),
                mainMovieRepository: dependecies.resolve(MainMovieRepository.self)
            )
        )
        dependecies.register(
            CarouselMainBannerUseCase.self,
            impl: CarouselMainBannerUseCaseImpl(
                mainBannerRepository: dependecies.resolve(MainBannerRepository.self)
            )
        )

        // MARK: - Presenter
    }
}
