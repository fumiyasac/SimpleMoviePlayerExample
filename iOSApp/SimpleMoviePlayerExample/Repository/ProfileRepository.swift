//
//  ProfileRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/03.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol ProfileRepository {
    // プロフィール基本情報を取得する
    func find() -> Single<ProfileEntity>
    // プロフィールに紐づくアクテビティ一覧を取得する
    func findAllActivities() -> Single<[ProfileActivityEntity]>
    // プロフィールに紐づくコメント一覧を取得する
    func findAllComments() -> Single<[ProfileCommentEntity]>
}

final class ProfileRepositoryImpl: ProfileRepository {

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

    // MARK: - ProfileRepository

    func find() -> Single<ProfileEntity> {
        return apiClient.getProfile()
            .subscribe(
                on: backgroundScheduler
            )
    }

    func findAllActivities() -> Single<[ProfileActivityEntity]> {
        return apiClient.getProfileActivities()
            .subscribe(
                on: backgroundScheduler
            )
    }

    func findAllComments() -> Single<[ProfileCommentEntity]> {
        return apiClient.getProfileComments()
            .subscribe(
                on: backgroundScheduler
            )
    }
}
