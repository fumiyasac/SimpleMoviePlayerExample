//
//  DeleteFavoriteMainMovieUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol DeleteFavoriteMainMovieUseCase {
    func execute(mainMovieId: MainMovieId) -> Completable
}

final class DeleteFavoriteMainMovieUseCaseImpl: DeleteFavoriteMainMovieUseCase {

    private let favoriteMainMovieRepository: FavoriteMainMovieRepository

    // MARK: - Initializer

    init(
        favoriteMainMovieRepository: FavoriteMainMovieRepository
    ) {
        self.favoriteMainMovieRepository = favoriteMainMovieRepository
    }

    // MARK: - DeleteFavoriteMainMovieUseCase

    func execute(mainMovieId: MainMovieId) -> Completable {
        return favoriteMainMovieRepository.delete(mainMovieId: mainMovieId)
    }
}
