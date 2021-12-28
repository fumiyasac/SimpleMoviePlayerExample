//
//  SaveMovieSpeedUseCaseSpec.swift
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

final class SaveMovieSpeedUseCaseSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テストに必要なMockの準備
        let movieSpeedRepository = MovieSpeedRepositoryMock()

        let target = SaveMovieSpeedUseCaseImpl(
            movieSpeedRepository: movieSpeedRepository
        )

        // MEMO: このクラスにて実行したいテスト内容
        describe("SaveMovieSpeedUseCaseImpl") {

            // MARK: - executeを実行した際のテスト

            describe("#execute") {
                context("動画速度を保存する場合") {
                    let movieSpeed = MovieSpeed.speed100
                    beforeEach {
                        movieSpeedRepository.given(
                            .save(
                                movieSpeed: .value(movieSpeed),
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.execute(movieSpeed: movieSpeed).toBlocking().first()).to(beNil())
                    }
                }
            }
        }
    }
}
