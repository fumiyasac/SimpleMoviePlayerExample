//
//  SettingsPresenterImpl.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

final class SettingsPresenterImpl: SettingsPresenter {

    private let getMovieSettingsUseCase: GetMovieSettingsUseCase
    private let saveMovieQualityUseCase: SaveMovieQualityUseCase
    private let saveMovieSpeedUseCase: SaveMovieSpeedUseCase
    private let getQuestionsUseCase: GetQuestionsUseCase
    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        getMovieSettingsUseCase: GetMovieSettingsUseCase,
        saveMovieQualityUseCase: SaveMovieQualityUseCase,
        saveMovieSpeedUseCase: SaveMovieSpeedUseCase,
        getQuestionsUseCase: GetQuestionsUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getMovieSettingsUseCase = getMovieSettingsUseCase
        self.saveMovieQualityUseCase = saveMovieQualityUseCase
        self.saveMovieSpeedUseCase = saveMovieSpeedUseCase
        self.getQuestionsUseCase = getQuestionsUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func viewDidLoadTrigger() {}
}
