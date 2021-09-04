//
//  GetProfileUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/04.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetProfileUseCase {
    func execute() -> Single<ProfileDto>
}

final class GetProfileUseCaseImpl: GetProfileUseCase {

    private let profileRepository: ProfileRepository

    // MARK: - Initializer

    init(
        profileRepository: ProfileRepository
    ) {
        self.profileRepository = profileRepository
    }

    // MARK: - GetProfileUseCase

    func execute() -> Single<ProfileDto> {

        // MEMO: Single.zipを利用して他処理の実行を待ってから返したい型へ変換を試みる
        return Single.zip(
            profileRepository.find(),
            profileRepository.findAllActivities(),
            profileRepository.findAllComments()
        ).map { apiResponses -> ProfileDto in
            // MEMO: APIレスポンス取得結果とUserDefaultの処理結果を組み合わせてMainDtoを作成する
            let (profile, profileActivities, profileComments) = apiResponses
            return ProfileDto(
                profile: profile,
                profileActivities: profileActivities,
                profileComments: profileComments
            )
        }
    }
}
