//
//  FavoritePresenter.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

final class FavoritePresenterImpl: FavoritePresenter {

    private let getFavoriteMainMoviesUseCase: GetFavoriteMainMoviesUseCase
    private let deleteFavoriteMainMovieUseCase: DeleteFavoriteMainMovieUseCase
    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        getFavoriteMainMoviesUseCase: GetFavoriteMainMoviesUseCase,
        deleteFavoriteMainMovieUseCase: DeleteFavoriteMainMovieUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getFavoriteMainMoviesUseCase = getFavoriteMainMoviesUseCase
        self.deleteFavoriteMainMovieUseCase = deleteFavoriteMainMovieUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func viewWillAppearTrigger() {}
    
    func refreshTrigger() {}
}
