//
//  SaveLastShownMainMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/28.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol SaveLastShownMainMoviePlayTimeUseCase {
    // 画面表示に必要なデータを返す
    func execute(mainMovieId: MainMovieId, playTime: Float) -> Completable
}

final class SaveLastShownMainMoviePlayTimeUseCaseImpl: SaveLastShownMainMoviePlayTimeUseCase {

    private let lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository
    ) {
        self.lastShownMainMoviePlayTimeRepository = lastShownMainMoviePlayTimeRepository
    }

    // MARK: - SaveLastShownMainMoviePlayTimeUseCase
    
    func execute(
        mainMovieId: MainMovieId,
        playTime: Float
    ) -> Completable {
        return lastShownMainMoviePlayTimeRepository.savePlayTime(
            mainMovieId: mainMovieId,
            playTime: playTime
        )
    }
}
