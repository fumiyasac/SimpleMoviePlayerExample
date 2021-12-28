//
//  GetMovieSettingsUseCaseSpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/12/28.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class GetMovieSettingsUseCaseSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テストに必要なMockの準備
        let movieQualityRepository = MovieQualityRepositoryMock()
        let movieSpeedRepository = MovieSpeedRepositoryMock()

        let target = GetMovieSettingsUseCaseImpl(
            movieQualityRepository: movieQualityRepository,
            movieSpeedRepository: movieSpeedRepository
        )

        // MEMO: このクラスにて実行したいテスト内容
        describe("GetMovieSettingsUseCaseImpl") {

            // MARK: - executeを実行した際のテスト

            describe("#execute") {
                context("動画解像度と動画速度が取得できる場合") {
                    let movieQuality = MovieQuality.high
                    let movieSpeed = MovieSpeed.speed100
                    beforeEach {
                        movieQualityRepository.given(
                            .find(
                                willReturn: Single.just(movieQuality)
                            )
                        )
                        movieSpeedRepository.given(
                            .find(
                                willReturn: Single.just(movieSpeed)
                            )
                        )
                    }
                    it("指定したmovieQualityとMovieSpeedが反映されたMovieSettingsDtoを返す") {
                        let expected = MovieSettingsDto(
                            movieQuality: movieQuality,
                            movieSpeed: movieSpeed
                        )
                        expect(try! target.execute().toBlocking().first()).to(equal(expected))
                    }
                }
            }
        }
    }
}
