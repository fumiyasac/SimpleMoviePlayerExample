//
//  FeaturedMovieRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol FeaturedMovieRepository {
    // 特集動画コンテンツ一覧を取得する
    func findAll() -> Single<[FeaturedMovieEntity]>
}

final class FeaturedMovieRepositoryImpl: FeaturedMovieRepository {

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

    // MARK: - FeaturedMovieRepository

    func findAll() -> Single<[FeaturedMovieEntity]> {
        return apiClient.getFeaturedMovies()
            .subscribe(
                on: backgroundScheduler
            )
    }
}
