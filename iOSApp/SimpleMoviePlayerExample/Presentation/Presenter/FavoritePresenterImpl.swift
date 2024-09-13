//
//  FavoritePresenter.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

final class FavoritePresenterImpl: FavoritePresenter {

    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        mainScheduler: ImmediateSchedulerType
    ) {
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func viewWillAppearTrigger() {}
    
    func refreshTrigger() {}
}
