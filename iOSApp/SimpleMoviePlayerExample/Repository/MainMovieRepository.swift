//
//  MainMovieRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MainMovieRepository {
    // メイン動画コンテンツ一覧を取得する
    func findAll() -> Single<[MainMovieEntity]>
    // IDに紐づくメイン動画コンテンツを取得する
    func findById(mainMovieId: MainMovieId) -> Single<MainMovieEntity>
}

final class MainMovieRepositoryImpl: MainMovieRepository {

    private let apiClient: ApiClient
    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        apiClient: ApiClient,
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.apiClient = apiClient
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - MainMovieRepository

    func findAll() -> Single<[MainMovieEntity]> {
        return apiClient.getMainMovies()
            .subscribe(
                on: backgroundScheduler
            )
    }

    func findById(mainMovieId: MainMovieId) -> Single<MainMovieEntity> {
        return apiClient
            .getMainMovie(
                movieId: mainMovieId.value
            )
            .subscribe(
                on: backgroundScheduler
            )
    }
}
