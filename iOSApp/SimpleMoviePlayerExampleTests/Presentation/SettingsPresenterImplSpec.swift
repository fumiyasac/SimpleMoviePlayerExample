//
//  SettingsPresenterImplSpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/12/29.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class SettingsPresenterImplSpec: QuickSpec {

    // MARK: - Override

    override func spec() {
        
        // MEMO: テストに必要なMockの準備
        let getMovieSettingsUseCase = GetMovieSettingsUseCaseMock()
        let getQuestionsUseCase = GetQuestionsUseCaseMock()
        let saveMovieQualityUseCase = SaveMovieQualityUseCaseMock()
        let saveMovieSpeedUseCase = SaveMovieSpeedUseCaseMock()
        let mainScheduler = CurrentThreadScheduler.instance

        // MEMO: このクラスにて実行したいテスト内容
        describe("SettingsPresenterImpl") {

            // MARK: - viewDidLoadTriggerを実行した際のテスト

            describe("#viewDidLoadTrigger") {
                let view = SettingsViewMock()
                let coodinator = SettingsCoodinatorMock()
                let target = SettingsPresenterImpl(
                    getMovieSettingsUseCase: getMovieSettingsUseCase,
                    getQuestionsUseCase: getQuestionsUseCase,
                    saveMovieQualityUseCase: saveMovieQualityUseCase,
                    saveMovieSpeedUseCase: saveMovieSpeedUseCase,
                    mainScheduler: mainScheduler
                )
                // テストで利用する仮の値を設定する
                let movieQuality = MovieQuality.high
                let movieSpeed = MovieSpeed.speed100
                let movieSettingsDto = MovieSettingsDto(
                    movieQuality: movieQuality,
                    movieSpeed: movieSpeed
                )
                let questionEntities = [
                    QuestionEntity(
                        id: 1,
                        question: "Question1",
                        answer: "Answer1"
                    ),
                    QuestionEntity(
                        id: 2,
                        question: "Question2",
                        answer: "Answer2"
                    ),
                    QuestionEntity(
                        id: 3,
                        question: "Question3",
                        answer: "Answer3"
                    )
                ]
                let questionDto = QuestionDto(questions: questionEntities)
                // テストを実行する前の準備
                target.setup(
                    view: view,
                    coodinator: coodinator
                )
                beforeEach {
                    getMovieSettingsUseCase.given(
                        .execute(
                            willReturn: Single.just(movieSettingsDto)
                        )
                    )
                    getQuestionsUseCase.given(
                        .execute(
                            willReturn: Single.just(questionDto)
                        )
                    )
                }
                // テストケース実行
                it("画面描画処理のapplyAllViewObjectsToDataSourceが1回実行される") {
                    let movieQualityViewObject = MovieQualityViewObject(movieQuality: movieSettingsDto.movieQuality)
                    let movieSpeedViewObject = MovieSpeedViewObject(movieSpeed: movieSettingsDto.movieSpeed)
                    let questionViewObjects = questionDto.questions.map { questionEntity in
                        QuestionViewObject(questionEntity: questionEntity)
                    }
                    target.viewDidLoadTrigger()
                    view.verify(
                        .applyAllViewObjectsToDataSource(
                            movieQualityViewObject: .value(movieQualityViewObject),
                            movieSpeedViewObject: .value(movieSpeedViewObject),
                            questionViewObjects: .value(questionViewObjects)
                        ),
                        count: .once
                    )
                }
            }

            // MARK: - didSelectNewMovieQualityTriggerを実行した際のテスト

            describe("#didSelectNewMovieQualityTrigger") {
                let view = SettingsViewMock()
                let coodinator = SettingsCoodinatorMock()
                let target = SettingsPresenterImpl(
                    getMovieSettingsUseCase: getMovieSettingsUseCase,
                    getQuestionsUseCase: getQuestionsUseCase,
                    saveMovieQualityUseCase: saveMovieQualityUseCase,
                    saveMovieSpeedUseCase: saveMovieSpeedUseCase,
                    mainScheduler: mainScheduler
                )
                // テストで利用する仮の値を設定する
                let movieQuality = MovieQuality.medium
                // テストを実行する前の準備
                target.setup(
                    view: view,
                    coodinator: coodinator
                )
                beforeEach {
                    saveMovieQualityUseCase.given(
                        .execute(
                            movieQuality: .value(movieQuality),
                            willReturn: Completable.empty()
                        )
                    )
                }
                // テストケース実行
                it("画面描画処理のapplyNewMovieQualityViewObjectToDataSourceが1回実行される") {
                    target.didSelectNewMovieQualityTrigger(movieQuality: movieQuality)
                    view.verify(
                        .applyNewMovieQualityViewObjectToDataSource(
                            movieQuality: .value(movieQuality)
                        ),
                        count: .once
                    )
                }
            }

            // MARK: - didSelectNewMovieSpeedTriggerを実行した際のテスト

            describe("#didSelectNewMovieSpeedTrigger") {
                let view = SettingsViewMock()
                let coodinator = SettingsCoodinatorMock()
                let target = SettingsPresenterImpl(
                    getMovieSettingsUseCase: getMovieSettingsUseCase,
                    getQuestionsUseCase: getQuestionsUseCase,
                    saveMovieQualityUseCase: saveMovieQualityUseCase,
                    saveMovieSpeedUseCase: saveMovieSpeedUseCase,
                    mainScheduler: mainScheduler
                )
                // テストで利用する仮の値を設定する
                let movieSpeed = MovieSpeed.speed200
                // テストを実行する前の準備
                target.setup(
                    view: view,
                    coodinator: coodinator
                )
                beforeEach {
                    saveMovieSpeedUseCase.given(
                        .execute(
                            movieSpeed: .value(movieSpeed),
                            willReturn: Completable.empty()
                        )
                    )
                }
                // テストケース実行
                it("画面描画処理のapplyNewMovieSpeedViewObjectToDataSourceが1回実行される") {
                    target.didSelectNewMovieSpeedTrigger(movieSpeed: movieSpeed)
                    view.verify(
                        .applyNewMovieSpeedViewObjectToDataSource(
                            movieSpeed: .value(movieSpeed)
                        ),
                        count: .once
                    )
                }
            }
        }
    }
}
