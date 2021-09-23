//
//  GetMainMovieUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/23.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetMainMovieUseCase {
    func execute(mainMovieId: MainMovieId) -> Single<MainMovieEntity>
}

final class GetMainMovieUseCaseImpl: GetMainMovieUseCase {

    private let mainMovieRepository: MainMovieRepository

    // MARK: - Initializer

    init(
        mainMovieRepository: MainMovieRepository
    ) {
        self.mainMovieRepository = mainMovieRepository
    }

    // MARK: - GetMainMovieUseCase

    func execute(mainMovieId: MainMovieId) -> Single<MainMovieEntity> {
        return mainMovieRepository.findById(mainMovieId: mainMovieId).flatMap { mainMovie in
            return Single.just(mainMovie)
        }
    }
}
