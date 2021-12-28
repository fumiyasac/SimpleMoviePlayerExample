//
//  SaveMovieQualityUseCaseSpec.swift
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

final class SaveMovieQualityUseCaseSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テストに必要なMockの準備
        let movieQualityRepository = MovieQualityRepositoryMock()

        let target = SaveMovieQualityUseCaseImpl(
            movieQualityRepository: movieQualityRepository
        )

        // MEMO: このクラスにて実行したいテスト内容
        describe("SaveMovieQualityUseCaseImpl") {

            // MARK: - executeを実行した際のテスト

            describe("#execute") {
                context("動画解像度を保存する場合") {
                    let movieQuality = MovieQuality.high
                    beforeEach {
                        movieQualityRepository.given(
                            .save(
                                movieQuality: .value(movieQuality),
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.execute(movieQuality: movieQuality).toBlocking().first()).to(beNil())
                    }
                }
            }
        }
    }
}
