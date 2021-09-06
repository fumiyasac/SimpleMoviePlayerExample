//
//  DeleteLastShownMainMoviePlayTimeUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/06.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol DeleteLastShownMainMoviePlayTimeUseCase {
    // 画面表示に必要なデータを返す
    func execute(mainMovieId: MainMovieId) -> Completable
}

final class DeleteLastShownMainMoviePlayTimeUseCaseImpl: DeleteLastShownMainMoviePlayTimeUseCase {

    private let lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository

    // MARK: - Initializer

    init(
        lastShownMainMoviePlayTimeRepository: LastShownMainMoviePlayTimeRepository
    ) {
        self.lastShownMainMoviePlayTimeRepository = lastShownMainMoviePlayTimeRepository
    }

    // MARK: - DeleteLastShownMainMoviePlayTimeUseCase
    
    func execute(
        mainMovieId: MainMovieId
    ) -> Completable {
        return lastShownMainMoviePlayTimeRepository.deletePlayTime(mainMovieId: mainMovieId)
    }
}
