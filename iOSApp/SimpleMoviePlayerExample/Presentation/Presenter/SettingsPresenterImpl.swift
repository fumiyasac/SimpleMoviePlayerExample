//
//  SettingsPresenterImpl.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

final class SettingsPresenterImpl: SettingsPresenter {

    // MARK: - Property

    private weak var view: SettingsView?
    private weak var coodinator: SettingsCoodinator?

    private let getMovieSettingsUseCase: GetMovieSettingsUseCase
    private let getQuestionsUseCase: GetQuestionsUseCase
    private let saveMovieQualityUseCase: SaveMovieQualityUseCase
    private let saveMovieSpeedUseCase: SaveMovieSpeedUseCase
    private let mainScheduler: ImmediateSchedulerType

    private let disposeBag = DisposeBag()

    // MARK: - Initializer

    init(
        getMovieSettingsUseCase: GetMovieSettingsUseCase,
        getQuestionsUseCase: GetQuestionsUseCase,
        saveMovieQualityUseCase: SaveMovieQualityUseCase,
        saveMovieSpeedUseCase: SaveMovieSpeedUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getMovieSettingsUseCase = getMovieSettingsUseCase
        self.getQuestionsUseCase = getQuestionsUseCase
        self.saveMovieQualityUseCase = saveMovieQualityUseCase
        self.saveMovieSpeedUseCase = saveMovieSpeedUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func setup(
        view: SettingsView,
        coodinator: SettingsCoodinator
    ) {
        self.view = view
        self.coodinator = coodinator
    }

    func viewDidAppearTrigger() {
        Single
            .zip(
                getMovieSettingsUseCase.execute(),
                getQuestionsUseCase.execute()
            ).observe(
                on: mainScheduler
            ).subscribe(
                onSuccess: { [weak self] movieSettingsDto, questionDto in
                    guard let weakSelf = self else {
                        return
                    }
                    weakSelf.view?.applyDataSource(
                        movieSettingsDto: movieSettingsDto,
                        questionDto: questionDto
                    )
                },
                onFailure: { [weak self] error in
                    print(error)
                }
            ).disposed(by: disposeBag)
    }
}
