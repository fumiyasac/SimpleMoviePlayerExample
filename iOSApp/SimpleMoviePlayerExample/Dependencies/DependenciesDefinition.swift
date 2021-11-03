//
//  DependenciesDefinition.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import Foundation
import RxSwift

// MEMO: Infra/Repository/UseCaseについてはDIコンテナに登録する
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
        #if targetEnvironment(simulator)
        // MEMO: Simulator検証時にはこちらを利用
        dependecies.register(
            ApiClient.self,
            impl: ApiClientManager.shared
        )
        #else
        dependecies.register(
            ApiClient.self,
            impl: ApiClientMock.shared
        )
        #endif

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
        dependecies.register(
            MovieQualityLocalStore.self,
            impl: MovieQualityLocalStoreImpl()
        )
        dependecies.register(
            MovieSpeedLocalStore.self,
            impl:MovieSpeedLocalStoreImpl()
        )

        // MEMO: (3) SQLite関連処理部分
        dependecies.register(
            SQLiteHelper.self,
            impl: SQLiteManager.shared
        )

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
        dependecies.register(
            FavoriteMainMovieRepository.self,
            impl: FavoriteMainMovieRepositoryImpl(
                sqliteHelper: dependecies.resolve(SQLiteHelper.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            MovieQualityRepository.self,
            impl: MovieQualityRepositoryImpl(
                movieQualityLocalStore: dependecies.resolve(MovieQualityLocalStore.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            MovieSpeedRepository.self,
            impl: MovieSpeedRepositoryImpl(
                movieSpeedLocalStore: dependecies.resolve(MovieSpeedLocalStore.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            QuestionRepository.self,
            impl:QuestionRepositoryImpl(
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )
        dependecies.register(
            ProfileRepository.self,
            impl:ProfileRepositoryImpl(
                apiClient: dependecies.resolve(ApiClient.self),
                backgroundScheduler: dependecies.resolve(ImmediateSchedulerType.self, name: background)
            )
        )

        // MARK: - UseCase

        dependecies.register(
            GetMainElementsUseCase.self,
            impl: GetMainElementsUseCaseImpl(
                initialAppOpenRepository: dependecies.resolve(InitialAppOpenRepository.self),
                mainNewsRepository: dependecies.resolve(MainNewsRepository.self),
                featuredMovieRepository: dependecies.resolve(FeaturedMovieRepository.self),
                mainMovieRepository: dependecies.resolve(MainMovieRepository.self)
            )
        )
        dependecies.register(
            GetCarouselMainBannersUseCase.self,
            impl: GetCarouselMainBannersUseCaseImpl(
                mainBannerRepository: dependecies.resolve(MainBannerRepository.self)
            )
        )
        dependecies.register(
            GetQuestionsUseCase.self,
            impl: GetQuestionsUseCaseImpl(
                questionRepository: dependecies.resolve(QuestionRepository.self)
            )
        )
        dependecies.register(
            GetMovieSettingsUseCase.self,
            impl: GetMovieSettingsUseCaseImpl(
                movieQualityRepository: dependecies.resolve(MovieQualityRepository.self),
                movieSpeedRepository: dependecies.resolve(MovieSpeedRepository.self)
            )
        )
        dependecies.register(
            SaveMovieQualityUseCase.self,
            impl: SaveMovieQualityUseCaseImpl(
                movieQualityRepository: dependecies.resolve(MovieQualityRepository.self)
            )
        )
        dependecies.register(
            SaveMovieSpeedUseCase.self,
            impl: SaveMovieSpeedUseCaseImpl(
                movieSpeedRepository: dependecies.resolve(MovieSpeedRepository.self)
            )
        )
        dependecies.register(
            GetFavoriteMainMoviesUseCase.self,
            impl: GetFavoriteMainMoviesUseCaseImpl(
                favoriteMainMovieRepository: dependecies.resolve(FavoriteMainMovieRepository.self)
            )
        )
        dependecies.register(
            DeleteFavoriteMainMovieUseCase.self,
            impl: DeleteFavoriteMainMovieUseCaseImpl(
                favoriteMainMovieRepository: dependecies.resolve(FavoriteMainMovieRepository.self)
            )
        )
        dependecies.register(
            SaveFavoriteMainMovieUseCase.self,
            impl: SaveFavoriteMainMovieUseCaseImpl(
                favoriteMainMovieRepository: dependecies.resolve(FavoriteMainMovieRepository.self)
            )
        )
        dependecies.register(
            GetLastShownFeatureMoviePlayTimeUseCase.self,
            impl: GetLastShownFeatureMoviePlayTimeUseCaseImpl(
                lastShownFeaturedMoviePlayTimeRepository: dependecies.resolve(LastShownFeaturedMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            SaveLastShownFeatureMoviePlayTimeUseCase.self,
            impl: SaveLastShownFeatureMoviePlayTimeUseCaseImpl(
                lastShownFeaturedMoviePlayTimeRepository: dependecies.resolve(LastShownFeaturedMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            DeleteLastShownFeatureMoviePlayTimeUseCase.self,
            impl: DeleteLastShownFeatureMoviePlayTimeUseCaseImpl(
                lastShownFeaturedMoviePlayTimeRepository: dependecies.resolve(LastShownFeaturedMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            GetLastShownMainMoviePlayTimeUseCase.self,
            impl: GetLastShownMainMoviePlayTimeUseCaseImpl(
                lastShownMainMoviePlayTimeRepository: dependecies.resolve(LastShownMainMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            SaveLastShownMainMoviePlayTimeUseCase.self,
            impl: SaveLastShownMainMoviePlayTimeUseCaseImpl(
                lastShownMainMoviePlayTimeRepository: dependecies.resolve(LastShownMainMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            DeleteLastShownMainMoviePlayTimeUseCase.self,
            impl: DeleteLastShownMainMoviePlayTimeUseCaseImpl(
                lastShownMainMoviePlayTimeRepository: dependecies.resolve(LastShownMainMoviePlayTimeRepository.self)
            )
        )
        dependecies.register(
            GetInitialAppOpenUseCase.self,
            impl: GetInitialAppOpenUseCaseImpl(
                initialAppOpenRepository: dependecies.resolve(InitialAppOpenRepository.self)
            )
        )
        dependecies.register(
            ChangeFalseInitialAppOpenUseCase.self,
            impl: ChangeFalseInitialAppOpenUseCaseImpl(
                initialAppOpenRepository: dependecies.resolve(InitialAppOpenRepository.self)
            )
        )
        dependecies.register(
            GetProfileUseCase.self,
            impl: GetProfileUseCaseImpl(
                profileRepository: dependecies.resolve(ProfileRepository.self)
            )
        )
    }
}

// MEMO: PresenterについてはDIコンテナに登録せずにStoryboard初期化時にFactoryメソッドを利用して適用する
final class PresenterFactory {

    // MEMO: インスタンスを保持するための場所（UseCaseを呼び出すために利用する）
    private static let dependecies = DependeciesContainer.shared

    // MARK: - Static Function

    static func createMainPresneter() -> MainPresenter {
        return MainPresenterImpl(
            getMainElementsUseCase: dependecies.resolve(GetMainElementsUseCase.self),
            getFavoriteMainMoviesUseCase: dependecies.resolve(GetFavoriteMainMoviesUseCase.self),
            saveFavoriteMainMovieUseCase: dependecies.resolve(SaveFavoriteMainMovieUseCase.self),
            getInitialAppOpenUseCase: dependecies.resolve(GetInitialAppOpenUseCase.self),
            changeFalseInitialAppOpenUseCase: dependecies.resolve(ChangeFalseInitialAppOpenUseCase.self),
            mainScheduler: dependecies.resolve(ImmediateSchedulerType.self)
        )
    }

    static func createMainBannerContainerPresenter() -> MainBannerContainerPresenter {
        return MainBannerContainerPresenterImpl(
            getCarouselMainBannersUseCase: dependecies.resolve(GetCarouselMainBannersUseCase.self),
            mainScheduler: dependecies.resolve(ImmediateSchedulerType.self)
        )
    }

    static func createFavoritePresenter() -> FavoritePresenter {
        return FavoritePresenterImpl(
            getFavoriteMainMoviesUseCase: dependecies.resolve(GetFavoriteMainMoviesUseCase.self),
            deleteFavoriteMainMovieUseCase: dependecies.resolve(DeleteFavoriteMainMovieUseCase.self),
            mainScheduler: dependecies.resolve(ImmediateSchedulerType.self)
        )
    }

    static func createSettingsPresenter() -> SettingsPresenter {
        return SettingsPresenterImpl(
            getMovieSettingsUseCase: dependecies.resolve(GetMovieSettingsUseCase.self),
            getQuestionsUseCase: dependecies.resolve(GetQuestionsUseCase.self),
            saveMovieQualityUseCase: dependecies.resolve(SaveMovieQualityUseCase.self),
            saveMovieSpeedUseCase: dependecies.resolve(SaveMovieSpeedUseCase.self),
            mainScheduler: dependecies.resolve(ImmediateSchedulerType.self)
        )
    }
}
