//
//  GetLastShownMainMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetLastShownMainMoviePlayTimeUseCase {
    // 画面表示に必要なデータを返す
    func execute(mainMovieId: MainMovieId) -> Single<Float>
}

final class GetLastShownMainMoviePlayTimeUseCaseImpl: GetLastShownMainMoviePlayTimeUseCase {

    private let lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository
    ) {
        self.lastShownMainMoviePlayTimeRepository = lastShownMainMoviePlayTimeRepository
    }

    // MARK: - GetLastShownMainMoviePlayTimeUseCase

    func execute(mainMovieId: MainMovieId) -> Single<Float> {
        return lastShownMainMoviePlayTimeRepository.getPlayTime(mainMovieId: mainMovieId)
    }
}
