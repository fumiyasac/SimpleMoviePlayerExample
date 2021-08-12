//
//  MainNewsRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MainNewsRepository {
    // メインバナー一覧を取得する
    func findAll() -> Single<[MainNewsEntity]>
}

final class MainNewsRepositoryImpl: MainNewsRepository {

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

    // MARK: - MainNewsRepository

    func findAll() -> Single<[MainNewsEntity]> {
        return apiClient.getMainNews()
            .subscribe(
                on: backgroundScheduler
            )
    }
}
