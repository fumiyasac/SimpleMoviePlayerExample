//
//  MainPresenterImpl.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/25.
//

import Foundation
import RxSwift

final class MainPresenterImpl: MainPresenter {

    private let getMainUseCase: GetMainUseCase
    private let getInitialAppOpenUseCase: GetInitialAppOpenUseCase
    private let changeFalseInitialAppOpenUseCase: ChangeFalseInitialAppOpenUseCase
    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        getMainUseCase: GetMainUseCase,
        getInitialAppOpenUseCase: GetInitialAppOpenUseCase,
        changeFalseInitialAppOpenUseCase: ChangeFalseInitialAppOpenUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getMainUseCase = getMainUseCase
        self.getInitialAppOpenUseCase = getInitialAppOpenUseCase
        self.changeFalseInitialAppOpenUseCase = changeFalseInitialAppOpenUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func viewWillAppearTrigger() {}
    
    func refreshTrigger() {}

    func addOrRemoveFavorite(mainMovieEntity: MainMovieEntity) {}
}
