//
//  SaveFavoriteMainMovieUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol SaveFavoriteMainMovieUseCase {
    func save(mainMovieEntity: MainMovieEntity) -> Completable
}

final class SaveFavoriteMainMovieUseCaseImpl: SaveFavoriteMainMovieUseCase {

    private let favoriteMainMovieRepository: FavoriteMainMovieRepository

    // MARK: - Initializer

    init(
        favoriteMainMovieRepository: FavoriteMainMovieRepository
    ) {
        self.favoriteMainMovieRepository = favoriteMainMovieRepository
    }

    // MARK: - SaveFavoriteMainMovieUseCase

    func save(mainMovieEntity: MainMovieEntity) -> Completable {
        return favoriteMainMovieRepository.save(mainMovieEntity: mainMovieEntity)
    }
}
