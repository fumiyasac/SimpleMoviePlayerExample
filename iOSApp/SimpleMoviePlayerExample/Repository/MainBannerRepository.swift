//
//  MainBannerRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MainBannerRepository {
    // メインバナー一覧を取得する
    func findAll() -> Single<[MainBannerEntity]>
}

final class MainBannerRepositoryImpl: MainBannerRepository {

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

    // MARK: - MainBannerRepository

    func findAll() -> Single<[MainBannerEntity]> {
        return apiClient.getMainBanners()
            .subscribe(
                on: backgroundScheduler
            )
    }
}
