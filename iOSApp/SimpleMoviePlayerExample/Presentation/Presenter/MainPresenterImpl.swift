//
//  MainPresenterImpl.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/25.
//

import Foundation
import RxSwift

final class MainPresenterImpl: MainPresenter {

    // MARK: - Property

    private weak var view: MainView?
    private weak var coodinator: MainCoodinator?

    private let getMainUseCase: GetMainUseCase
    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        getMainUseCase: GetMainUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getMainUseCase = getMainUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func setup(
        view: MainView,
        coodinator: MainCoodinator
    ) {
        self.view = view
        self.coodinator = coodinator
    }

    func viewDidLoadTrigger() {
        //
    }

    func refreshTrigger() {
        //
    }

    func didTapMainMovieCell(mainMovieViewObject: MainMovieViewObject) {
        //
    }

    func didTapFeaturedMovieCell(featuredMovieViewObject: FeaturedMovieViewObject) {
        //
    }
}
